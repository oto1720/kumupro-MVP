import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kumupro_mvp/domain/entities/position.dart';

part 'stage_model.freezed.dart';
part 'stage_model.g.dart';

@freezed
class StageModel with _$StageModel {
  const factory StageModel({
    required String id,
    required String name,
    required String description,
    required int width,
    required int height,
    required List<List<String>> grid,
    required Position startPosition,
    required Position goalPosition,
    @Default([]) List<Position> keyPositions,
    @Default([]) List<Position> wallPositions,
    @Default(1) int difficulty,
    @Default(false) bool isCompleted,
    @Default(0) int bestScore,
  }) = _StageModel;

  factory StageModel.fromJson(Map<String, dynamic> json) =>
      _$StageModelFromJson(json);
}

@freezed
class StageProgressModel with _$StageProgressModel {
  const factory StageProgressModel({
    required String stageId,
    required bool isCompleted,
    required int attempts,
    required int bestCommandCount,
    required DateTime? completedAt,
    required DateTime lastAttemptAt,
  }) = _StageProgressModel;

  factory StageProgressModel.fromJson(Map<String, dynamic> json) =>
      _$StageProgressModelFromJson(json);
}