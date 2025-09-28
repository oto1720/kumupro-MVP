import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kumupro_mvp/core/constants/game_constants.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String id,
    required CardType type,
    required String direction,
    @Default(false) bool isUsed,
    @Default(0.0) double confidence,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}

enum CardType {
  @JsonValue('move')
  move,
  @JsonValue('grab')
  grab,
  @JsonValue('jump')
  jump,
}

extension CardTypeExtension on CardType {
  String get displayName {
    switch (this) {
      case CardType.move:
        return '移動';
      case CardType.grab:
        return '掴む';
      case CardType.jump:
        return 'ジャンプ';
    }
  }

  String get iconPath {
    switch (this) {
      case CardType.move:
        return 'assets/icons/move_card.png';
      case CardType.grab:
        return 'assets/icons/grab_card.png';
      case CardType.jump:
        return 'assets/icons/jump_card.png';
    }
  }
}

extension CardDirection on String {
  bool get isValidDirection {
    return [
      GameConstants.directionUp,
      GameConstants.directionDown,
      GameConstants.directionLeft,
      GameConstants.directionRight,
    ].contains(this);
  }

  String get displayName {
    switch (this) {
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