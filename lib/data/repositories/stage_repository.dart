import 'package:kumupro_mvp/data/models/stage_model.dart';
import 'package:kumupro_mvp/domain/entities/position.dart';
import 'package:kumupro_mvp/core/constants/game_constants.dart';

class StageRepository {
  static final List<StageModel> _stages = [
    // ステージ1: 真っ直ぐのステージ
    StageModel(
      id: 'stage_1',
      name: 'ステージ1',
      description: '右に3歩進んでゴールを目指そう！',
      width: 6,
      height: 4,
      grid: [
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'start', 'empty', 'empty', 'goal', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
      ],
      startPosition: const Position(x: 1, y: 1),
      goalPosition: const Position(x: 4, y: 1),
      difficulty: 1,
    ),

    // ステージ2: 鍵を取ってゴール
    StageModel(
      id: 'stage_2',
      name: 'ステージ2',
      description: '鍵を取ってからゴールしよう！',
      width: 6,
      height: 4,
      grid: [
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'start', 'key', 'empty', 'goal', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
      ],
      startPosition: const Position(x: 1, y: 1),
      goalPosition: const Position(x: 4, y: 1),
      keyPositions: [const Position(x: 2, y: 1)],
      difficulty: 2,
    ),

    // ステージ3: L字型の道
    StageModel(
      id: 'stage_3',
      name: 'ステージ3',
      description: '曲がり道を通ってゴールしよう！',
      width: 6,
      height: 5,
      grid: [
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'start', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'goal', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
      ],
      startPosition: const Position(x: 1, y: 1),
      goalPosition: const Position(x: 3, y: 3),
      difficulty: 3,
    ),

    // ステージ2-1: 繰り返しが必要
    StageModel(
      id: 'stage_2_1',
      name: 'ステージ2-1',
      description: '繰り返しブロックを使って効率よく進もう！',
      width: 8,
      height: 4,
      grid: [
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'start', 'empty', 'empty', 'empty', 'empty', 'goal', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
      ],
      startPosition: const Position(x: 1, y: 1),
      goalPosition: const Position(x: 6, y: 1),
      difficulty: 4,
    ),

    // ステージ2-2: 壁のある迷路
    StageModel(
      id: 'stage_2_2',
      name: 'ステージ2-2',
      description: '壁を避けてゴールを目指そう！',
      width: 7,
      height: 5,
      grid: [
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'start', 'empty', 'wall', 'empty', 'goal', 'empty'],
        ['empty', 'empty', 'empty', 'wall', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
        ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'],
      ],
      startPosition: const Position(x: 1, y: 1),
      goalPosition: const Position(x: 5, y: 1),
      wallPositions: [
        const Position(x: 3, y: 1),
        const Position(x: 3, y: 2),
      ],
      difficulty: 5,
    ),
  ];

  Future<List<StageModel>> getAllStages() async {
    // 実際のアプリではAPIやローカルDBから取得
    await Future.delayed(const Duration(milliseconds: 100));
    return _stages;
  }

  Future<StageModel?> getStageById(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    try {
      return _stages.firstWhere((stage) => stage.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<StageModel>> getStagesByDifficulty(int difficulty) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _stages.where((stage) => stage.difficulty == difficulty).toList();
  }

  Future<StageModel?> getNextStage(String currentStageId) async {
    await Future.delayed(const Duration(milliseconds: 50));
    final currentIndex = _stages.indexWhere((stage) => stage.id == currentStageId);
    if (currentIndex == -1 || currentIndex >= _stages.length - 1) {
      return null;
    }
    return _stages[currentIndex + 1];
  }

  Future<bool> isValidPosition(String stageId, Position position) async {
    final stage = await getStageById(stageId);
    if (stage == null) return false;

    // 範囲チェック
    if (!position.isValid(stage.width, stage.height)) return false;

    // 壁チェック
    final tileType = stage.grid[position.y][position.x];
    return tileType != GameConstants.tileWall;
  }

  Future<String> getTileType(String stageId, Position position) async {
    final stage = await getStageById(stageId);
    if (stage == null || !position.isValid(stage.width, stage.height)) {
      return GameConstants.tileEmpty;
    }
    return stage.grid[position.y][position.x];
  }
}