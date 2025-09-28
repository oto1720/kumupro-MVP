// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StageModelImpl _$$StageModelImplFromJson(Map<String, dynamic> json) =>
    _$StageModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      grid: (json['grid'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      startPosition: Position.fromJson(
        json['startPosition'] as Map<String, dynamic>,
      ),
      goalPosition: Position.fromJson(
        json['goalPosition'] as Map<String, dynamic>,
      ),
      keyPositions:
          (json['keyPositions'] as List<dynamic>?)
              ?.map((e) => Position.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      wallPositions:
          (json['wallPositions'] as List<dynamic>?)
              ?.map((e) => Position.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
      isCompleted: json['isCompleted'] as bool? ?? false,
      bestScore: (json['bestScore'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StageModelImplToJson(_$StageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'width': instance.width,
      'height': instance.height,
      'grid': instance.grid,
      'startPosition': instance.startPosition,
      'goalPosition': instance.goalPosition,
      'keyPositions': instance.keyPositions,
      'wallPositions': instance.wallPositions,
      'difficulty': instance.difficulty,
      'isCompleted': instance.isCompleted,
      'bestScore': instance.bestScore,
    };

_$StageProgressModelImpl _$$StageProgressModelImplFromJson(
  Map<String, dynamic> json,
) => _$StageProgressModelImpl(
  stageId: json['stageId'] as String,
  isCompleted: json['isCompleted'] as bool,
  attempts: (json['attempts'] as num).toInt(),
  bestCommandCount: (json['bestCommandCount'] as num).toInt(),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  lastAttemptAt: DateTime.parse(json['lastAttemptAt'] as String),
);

Map<String, dynamic> _$$StageProgressModelImplToJson(
  _$StageProgressModelImpl instance,
) => <String, dynamic>{
  'stageId': instance.stageId,
  'isCompleted': instance.isCompleted,
  'attempts': instance.attempts,
  'bestCommandCount': instance.bestCommandCount,
  'completedAt': instance.completedAt?.toIso8601String(),
  'lastAttemptAt': instance.lastAttemptAt.toIso8601String(),
};
