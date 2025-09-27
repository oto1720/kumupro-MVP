// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockModelImpl _$$BlockModelImplFromJson(Map<String, dynamic> json) =>
    _$BlockModelImpl(
      id: json['id'] as String,
      type: $enumDecode(_$BlockTypeEnumMap, json['type']),
      cards:
          (json['cards'] as List<dynamic>?)
              ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      repeatCount: (json['repeatCount'] as num?)?.toInt() ?? 1,
      condition: json['condition'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$BlockModelImplToJson(_$BlockModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$BlockTypeEnumMap[instance.type]!,
      'cards': instance.cards,
      'repeatCount': instance.repeatCount,
      'condition': instance.condition,
      'confidence': instance.confidence,
    };

const _$BlockTypeEnumMap = {
  BlockType.start: 'start',
  BlockType.repeat: 'repeat',
  BlockType.ifBlock: 'if',
};
