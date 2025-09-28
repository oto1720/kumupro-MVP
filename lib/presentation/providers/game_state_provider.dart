import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kumupro_mvp/domain/entities/game_state.dart';
import 'package:kumupro_mvp/data/models/character_model.dart';
import 'package:kumupro_mvp/data/repositories/stage_repository.dart';
import 'package:kumupro_mvp/data/services/mock_recognition_service.dart';
import 'package:kumupro_mvp/domain/usecases/command_execution_usecase.dart';
import 'package:kumupro_mvp/core/constants/game_constants.dart';

final gameStateProvider = StateNotifierProvider.family<GameStateNotifier, GameState?, String>(
  (ref, stageId) => GameStateNotifier(stageId),
);

class GameStateNotifier extends StateNotifier<GameState?> {
  GameStateNotifier(this.stageId) : super(null) {
    _loadStage();
  }

  final String stageId;
  final StageRepository _stageRepository = StageRepository();
  final MockRecognitionService _recognitionService = MockRecognitionService();
  final CommandExecutionUseCase _commandExecutionUseCase = CommandExecutionUseCase();

  Future<void> _loadStage() async {
    try {
      final stage = await _stageRepository.getStageById(stageId);
      if (stage != null) {
        state = GameState(
          currentStage: stage,
          character: CharacterModel(
            position: stage.startPosition,
            direction: GameConstants.directionRight,
          ),
        );
      }
    } catch (e) {
      // エラーハンドリング
      state = null;
    }
  }

  /// カメラからの画像を認識してゲーム状態を更新
  Future<void> recognizeFromImage(String imagePath) async {
    if (state == null) return;

    // 認識中状態に変更
    state = state!.setStatus(GameStatus.recognizing);

    try {
      final result = await _recognitionService.recognizeImage(imagePath);

      if (result.isSuccess) {
        // 認識成功 - カードとブロックを更新
        state = state!.copyWith(
          recognizedCards: result.cards,
          recognizedBlocks: result.blocks,
          status: GameStatus.ready,
          errorMessage: null,
        ).addLogEntry('${result.cards.length}枚のカードと${result.blocks.length}個のブロックを認識しました');
      } else {
        // 認識失敗
        state = state!.setError(result.errorMessage ?? '認識に失敗しました');
      }
    } catch (e) {
      state = state!.setError('認識処理中にエラーが発生しました: $e');
    }
  }

  /// テスト用パターンで認識結果をセット
  Future<void> setTestPattern(int patternIndex) async {
    if (state == null) return;

    state = state!.setStatus(GameStatus.recognizing);

    try {
      final result = await _recognitionService.recognizeTestPattern(patternIndex);

      if (result.isSuccess) {
        state = state!.copyWith(
          recognizedCards: result.cards,
          recognizedBlocks: result.blocks,
          status: GameStatus.ready,
          errorMessage: null,
        ).addLogEntry('テストパターン${patternIndex + 1}を適用しました');
      } else {
        state = state!.setError(result.errorMessage ?? 'テストパターンの適用に失敗しました');
      }
    } catch (e) {
      state = state!.setError('テストパターンの処理中にエラーが発生しました: $e');
    }
  }

  /// ゲームをリセット
  void resetGame() {
    if (state == null) return;
    state = state!.reset();
  }

  /// コマンドを実行
  Future<void> executeCommands() async {
    if (state == null || !state!.canExecute) return;

    state = state!.setStatus(GameStatus.running);

    try {
      // コマンド実行シーケンスを生成
      final commands = _commandExecutionUseCase.generateExecutionSequence(
        state!.recognizedCards,
        state!.recognizedBlocks,
        state!.currentStage,
      );

      if (commands.isEmpty) {
        state = state!.setError('実行するコマンドがありません');
        return;
      }

      // コマンドを実行
      final result = await _commandExecutionUseCase.executeCommands(
        commands,
        state!.character,
        state!.currentStage,
      );

      if (result.isSuccess) {
        // 実行成功 - キャラクターと状態を更新
        state = state!.copyWith(
          character: result.finalCharacter,
          status: result.isCompleted ? GameStatus.completed : GameStatus.idle,
          executionLog: [...state!.executionLog, ...result.executionLog],
        );

        // アニメーション用のキャラクター状態も更新
        await _animateCharacterStates(result.characterStates);
      } else {
        // 実行失敗
        state = state!.copyWith(
          character: result.finalCharacter,
          status: GameStatus.failed,
          executionLog: [...state!.executionLog, ...result.executionLog],
          errorMessage: result.failureReason,
        );
      }
    } catch (e) {
      state = state!.setError('コマンド実行中にエラーが発生しました: $e');
    }
  }

  /// キャラクターのアニメーション状態を順次更新
  Future<void> _animateCharacterStates(List<CharacterModel> characterStates) async {
    for (final characterState in characterStates.skip(1)) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (state != null) {
        state = state!.updateCharacter(characterState);
      }
    }
  }

  /// キャラクターを移動
  void moveCharacter(String direction) {
    if (state == null) return;

    final currentCharacter = state!.character;
    final newCharacter = currentCharacter.turn(direction).move();

    state = state!.updateCharacter(newCharacter);
  }

  /// ログエントリを追加
  void addLogEntry(String message) {
    if (state == null) return;
    state = state!.addLogEntry(message);
  }

  /// エラーをクリア
  void clearError() {
    if (state == null) return;
    state = state!.clearError();
  }
}