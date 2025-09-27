// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      currentStage: StageModel.fromJson(
        json['currentStage'] as Map<String, dynamic>,
      ),
      character: CharacterModel.fromJson(
        json['character'] as Map<String, dynamic>,
      ),
      recognizedCards:
          (json['recognizedCards'] as List<dynamic>?)
              ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recognizedBlocks:
          (json['recognizedBlocks'] as List<dynamic>?)
              ?.map((e) => BlockModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      executionLog:
          (json['executionLog'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status:
          $enumDecodeNullable(_$GameStatusEnumMap, json['status']) ??
          GameStatus.idle,
      currentCommandIndex: (json['currentCommandIndex'] as num?)?.toInt() ?? 0,
      commandsExecuted: (json['commandsExecuted'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'currentStage': instance.currentStage,
      'character': instance.character,
      'recognizedCards': instance.recognizedCards,
      'recognizedBlocks': instance.recognizedBlocks,
      'executionLog': instance.executionLog,
      'status': _$GameStatusEnumMap[instance.status]!,
      'currentCommandIndex': instance.currentCommandIndex,
      'commandsExecuted': instance.commandsExecuted,
      'errorMessage': instance.errorMessage,
    };

const _$GameStatusEnumMap = {
  GameStatus.idle: 'idle',
  GameStatus.recognizing: 'recognizing',
  GameStatus.ready: 'ready',
  GameStatus.running: 'running',
  GameStatus.paused: 'paused',
  GameStatus.completed: 'completed',
  GameStatus.failed: 'failed',
};
