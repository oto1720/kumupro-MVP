import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kumupro_mvp/data/models/character_model.dart';
import 'package:kumupro_mvp/data/models/stage_model.dart';
import 'package:kumupro_mvp/data/models/card_model.dart';
import 'package:kumupro_mvp/data/models/block_model.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required StageModel currentStage,
    required CharacterModel character,
    @Default([]) List<CardModel> recognizedCards,
    @Default([]) List<BlockModel> recognizedBlocks,
    @Default([]) List<String> executionLog,
    @Default(GameStatus.idle) GameStatus status,
    @Default(0) int currentCommandIndex,
    @Default(0) int commandsExecuted,
    String? errorMessage,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
}

enum GameStatus {
  @JsonValue('idle')
  idle,
  @JsonValue('recognizing')
  recognizing,
  @JsonValue('ready')
  ready,
  @JsonValue('running')
  running,
  @JsonValue('paused')
  paused,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}

extension GameStateExtension on GameState {
  bool get isRunning => status == GameStatus.running;
  bool get isCompleted => status == GameStatus.completed;
  bool get isFailed => status == GameStatus.failed;
  bool get canExecute => status == GameStatus.ready || status == GameStatus.running;
  bool get hasCommands => recognizedCards.isNotEmpty || recognizedBlocks.isNotEmpty;

  GameState addLogEntry(String message) {
    return copyWith(
      executionLog: [...executionLog, message],
    );
  }

  GameState updateCharacter(CharacterModel newCharacter) {
    return copyWith(character: newCharacter);
  }

  GameState setStatus(GameStatus newStatus) {
    return copyWith(status: newStatus);
  }

  GameState setError(String error) {
    return copyWith(
      status: GameStatus.failed,
      errorMessage: error,
    );
  }

  GameState clearError() {
    return copyWith(errorMessage: null);
  }

  GameState incrementCommandIndex() {
    return copyWith(
      currentCommandIndex: currentCommandIndex + 1,
      commandsExecuted: commandsExecuted + 1,
    );
  }

  GameState reset() {
    return copyWith(
      character: CharacterModel(
        position: currentStage.startPosition,
        direction: 'right',
      ),
      executionLog: [],
      status: GameStatus.idle,
      currentCommandIndex: 0,
      commandsExecuted: 0,
      errorMessage: null,
    );
  }
}