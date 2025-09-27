import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kumupro_mvp/data/models/card_model.dart';

part 'block_model.freezed.dart';
part 'block_model.g.dart';

@freezed
class BlockModel with _$BlockModel {
  const factory BlockModel({
    required String id,
    required BlockType type,
    @Default([]) List<CardModel> cards,
    @Default(1) int repeatCount,
    String? condition,
    @Default(0.0) double confidence,
  }) = _BlockModel;

  factory BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);
}

enum BlockType {
  @JsonValue('start')
  start,
  @JsonValue('repeat')
  repeat,
  @JsonValue('if')
  ifBlock,
}

extension BlockTypeExtension on BlockType {
  String get displayName {
    switch (this) {
      case BlockType.start:
        return 'スタート';
      case BlockType.repeat:
        return '繰り返し';
      case BlockType.ifBlock:
        return 'もし';
    }
  }

  String get iconPath {
    switch (this) {
      case BlockType.start:
        return 'assets/icons/start_block.png';
      case BlockType.repeat:
        return 'assets/icons/repeat_block.png';
      case BlockType.ifBlock:
        return 'assets/icons/if_block.png';
    }
  }

  bool get canContainCards {
    return this != BlockType.start;
  }

  bool get requiresRepeatCount {
    return this == BlockType.repeat;
  }

  bool get requiresCondition {
    return this == BlockType.ifBlock;
  }
}