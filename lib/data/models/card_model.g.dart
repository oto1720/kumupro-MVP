// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map<String, dynamic> json) =>
    _$CardModelImpl(
      id: json['id'] as String,
      type: $enumDecode(_$CardTypeEnumMap, json['type']),
      direction: json['direction'] as String,
      isUsed: json['isUsed'] as bool? ?? false,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$CardModelImplToJson(_$CardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$CardTypeEnumMap[instance.type]!,
      'direction': instance.direction,
      'isUsed': instance.isUsed,
      'confidence': instance.confidence,
    };

const _$CardTypeEnumMap = {
  CardType.move: 'move',
  CardType.grab: 'grab',
  CardType.jump: 'jump',
};
