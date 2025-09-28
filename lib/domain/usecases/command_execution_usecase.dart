import 'package:kumupro_mvp/data/models/card_model.dart';
import 'package:kumupro_mvp/data/models/block_model.dart';
import 'package:kumupro_mvp/data/models/character_model.dart';
import 'package:kumupro_mvp/data/models/stage_model.dart';
import 'package:kumupro_mvp/domain/entities/position.dart';
import 'package:kumupro_mvp/core/constants/game_constants.dart';

class CommandExecutionUseCase {
  /// カードとブロックのリストからコマンド実行シーケンスを生成
  List<ExecutionCommand> generateExecutionSequence(
    List<CardModel> cards,
    List<BlockModel> blocks,
    StageModel stage,
  ) {
    final List<ExecutionCommand> commands = [];

    // ブロックの処理
    for (final block in blocks) {
      switch (block.type) {
        case BlockType.start:
          commands.add(ExecutionCommand.start());
          break;
        case BlockType.repeat:
          commands.addAll(_processRepeatBlock(block));
          break;
        case BlockType.ifBlock:
          commands.addAll(_processIfBlock(block));
          break;
      }
    }

    // 単体カードの処理
    for (final card in cards) {
      commands.add(_cardToCommand(card));
    }

    return commands;
  }

  /// キャラクターをコマンドに従って移動
  Future<CommandExecutionResult> executeCommands(
    List<ExecutionCommand> commands,
    CharacterModel initialCharacter,
    StageModel stage,
  ) async {
    CharacterModel currentCharacter = initialCharacter;
    final List<String> executionLog = [];
    final List<CharacterModel> characterStates = [initialCharacter];

    for (int i = 0; i < commands.length; i++) {
      final command = commands[i];

      try {
        final result = await _executeCommand(command, currentCharacter, stage);

        if (!result.isSuccess) {
          return CommandExecutionResult(
            isSuccess: false,
            finalCharacter: currentCharacter,
            executionLog: [...executionLog, result.message],
            characterStates: characterStates,
            failureReason: result.message,
            commandIndex: i,
          );
        }

        currentCharacter = result.character;
        characterStates.add(currentCharacter);
        executionLog.add(result.message);

        // アニメーション用の待機
        await Future.delayed(const Duration(milliseconds: 500));

        // ゴール判定
        if (_isGoalReached(currentCharacter, stage)) {
          return CommandExecutionResult(
            isSuccess: true,
            finalCharacter: currentCharacter,
            executionLog: [...executionLog, 'ゴール到達！ステージクリア！'],
            characterStates: characterStates,
            isCompleted: true,
            commandIndex: i,
          );
        }

      } catch (e) {
        return CommandExecutionResult(
          isSuccess: false,
          finalCharacter: currentCharacter,
          executionLog: [...executionLog, 'エラー: $e'],
          characterStates: characterStates,
          failureReason: 'コマンド実行中にエラーが発生しました',
          commandIndex: i,
        );
      }
    }

    // 全コマンド実行完了
    final isCompleted = _isGoalReached(currentCharacter, stage);
    return CommandExecutionResult(
      isSuccess: true,
      finalCharacter: currentCharacter,
      executionLog: isCompleted
          ? [...executionLog, 'ゴール到達！ステージクリア！']
          : [...executionLog, 'プログラム実行完了'],
      characterStates: characterStates,
      isCompleted: isCompleted,
      commandIndex: commands.length - 1,
    );
  }

  Future<SingleCommandResult> _executeCommand(
    ExecutionCommand command,
    CharacterModel character,
    StageModel stage,
  ) async {
    switch (command.type) {
      case CommandType.move:
        return _executeMove(command.direction!, character, stage);
      case CommandType.grab:
        return _executeGrab(character, stage);
      case CommandType.jump:
        return _executeJump(command.direction!, character, stage);
      case CommandType.start:
        return SingleCommandResult(
          isSuccess: true,
          character: character,
          message: 'プログラム開始',
        );
    }
  }

  Future<SingleCommandResult> _executeMove(
    String direction,
    CharacterModel character,
    StageModel stage,
  ) async {
    final newCharacter = character.turn(direction);
    final nextPosition = newCharacter.getNextPosition();

    // 境界チェック
    if (!nextPosition.isValid(stage.width, stage.height)) {
      return SingleCommandResult(
        isSuccess: false,
        character: character,
        message: '壁にぶつかりました',
      );
    }

    // 壁チェック
    final tileType = stage.grid[nextPosition.y][nextPosition.x];
    if (tileType == GameConstants.tileWall) {
      return SingleCommandResult(
        isSuccess: false,
        character: character,
        message: '壁にぶつかりました',
      );
    }

    final movedCharacter = newCharacter.move().resetState();

    return SingleCommandResult(
      isSuccess: true,
      character: movedCharacter,
      message: '${_directionToJapanese(direction)}に移動しました',
    );
  }

  Future<SingleCommandResult> _executeGrab(
    CharacterModel character,
    StageModel stage,
  ) async {
    final position = character.position;
    final tileType = stage.grid[position.y][position.x];

    if (tileType == GameConstants.tileKey) {
      final newCharacter = character.collectKey().resetState();
      return SingleCommandResult(
        isSuccess: true,
        character: newCharacter,
        message: '鍵を取得しました',
      );
    }

    return SingleCommandResult(
      isSuccess: false,
      character: character,
      message: 'ここには何もありません',
    );
  }

  Future<SingleCommandResult> _executeJump(
    String direction,
    CharacterModel character,
    StageModel stage,
  ) async {
    final jumpCharacter = character.turn(direction);
    final jumpPosition = jumpCharacter.getNextPosition();

    // 2マス先をチェック（ジャンプ先）
    final landingPosition = Position(
      x: jumpPosition.x + (jumpPosition.x - character.position.x),
      y: jumpPosition.y + (jumpPosition.y - character.position.y),
    );

    if (!landingPosition.isValid(stage.width, stage.height)) {
      return SingleCommandResult(
        isSuccess: false,
        character: character,
        message: 'ジャンプできません',
      );
    }

    final landingTileType = stage.grid[landingPosition.y][landingPosition.x];
    if (landingTileType == GameConstants.tileWall) {
      return SingleCommandResult(
        isSuccess: false,
        character: character,
        message: 'ジャンプ先に壁があります',
      );
    }

    final jumpedCharacter = jumpCharacter.copyWith(
      position: landingPosition,
      state: CharacterState.idle,
    );

    return SingleCommandResult(
      isSuccess: true,
      character: jumpedCharacter,
      message: '${_directionToJapanese(direction)}にジャンプしました',
    );
  }

  List<ExecutionCommand> _processRepeatBlock(BlockModel block) {
    final List<ExecutionCommand> commands = [];

    for (int i = 0; i < block.repeatCount; i++) {
      for (final card in block.cards) {
        commands.add(_cardToCommand(card));
      }
    }

    return commands;
  }

  List<ExecutionCommand> _processIfBlock(BlockModel block) {
    // 条件判定は今後実装
    // 現在は常に実行する
    return block.cards.map(_cardToCommand).toList();
  }

  ExecutionCommand _cardToCommand(CardModel card) {
    switch (card.type) {
      case CardType.move:
        return ExecutionCommand.move(card.direction);
      case CardType.grab:
        return ExecutionCommand.grab();
      case CardType.jump:
        return ExecutionCommand.jump(card.direction);
    }
  }

  bool _isGoalReached(CharacterModel character, StageModel stage) {
    if (character.position != stage.goalPosition) return false;

    // 鍵が必要なステージの場合、鍵を持っているかチェック
    if (stage.keyPositions.isNotEmpty && !character.hasKey) {
      return false;
    }

    return true;
  }

  String _directionToJapanese(String direction) {
    switch (direction) {
      case GameConstants.directionUp:
        return '上';
      case GameConstants.directionDown:
        return '下';
      case GameConstants.directionLeft:
        return '左';
      case GameConstants.directionRight:
        return '右';
      default:
        return '';
    }
  }
}

enum CommandType { move, grab, jump, start }

class ExecutionCommand {
  final CommandType type;
  final String? direction;
  final int? repeatCount;

  const ExecutionCommand({
    required this.type,
    this.direction,
    this.repeatCount,
  });

  factory ExecutionCommand.move(String direction) =>
      ExecutionCommand(type: CommandType.move, direction: direction);

  factory ExecutionCommand.grab() =>
      const ExecutionCommand(type: CommandType.grab);

  factory ExecutionCommand.jump(String direction) =>
      ExecutionCommand(type: CommandType.jump, direction: direction);

  factory ExecutionCommand.start() =>
      const ExecutionCommand(type: CommandType.start);
}

class CommandExecutionResult {
  final bool isSuccess;
  final CharacterModel finalCharacter;
  final List<String> executionLog;
  final List<CharacterModel> characterStates;
  final bool isCompleted;
  final String? failureReason;
  final int commandIndex;

  const CommandExecutionResult({
    required this.isSuccess,
    required this.finalCharacter,
    required this.executionLog,
    required this.characterStates,
    this.isCompleted = false,
    this.failureReason,
    required this.commandIndex,
  });
}

class SingleCommandResult {
  final bool isSuccess;
  final CharacterModel character;
  final String message;

  const SingleCommandResult({
    required this.isSuccess,
    required this.character,
    required this.message,
  });
}