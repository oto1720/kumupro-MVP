// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterModelImpl _$$CharacterModelImplFromJson(Map<String, dynamic> json) =>
    _$CharacterModelImpl(
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      direction: json['direction'] as String,
      hasKey: json['hasKey'] as bool? ?? false,
      inventory:
          (json['inventory'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      state:
          $enumDecodeNullable(_$CharacterStateEnumMap, json['state']) ??
          CharacterState.idle,
    );

Map<String, dynamic> _$$CharacterModelImplToJson(
  _$CharacterModelImpl instance,
) => <String, dynamic>{
  'position': instance.position,
  'direction': instance.direction,
  'hasKey': instance.hasKey,
  'inventory': instance.inventory,
  'state': _$CharacterStateEnumMap[instance.state]!,
};

const _$CharacterStateEnumMap = {
  CharacterState.idle: 'idle',
  CharacterState.moving: 'moving',
  CharacterState.grabbing: 'grabbing',
  CharacterState.jumping: 'jumping',
};
