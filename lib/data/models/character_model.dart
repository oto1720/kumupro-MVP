import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kumupro_mvp/domain/entities/position.dart';
import 'package:kumupro_mvp/core/constants/game_constants.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required Position position,
    required String direction,
    @Default(false) bool hasKey,
    @Default([]) List<String> inventory,
    @Default(CharacterState.idle) CharacterState state,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

enum CharacterState {
  @JsonValue('idle')
  idle,
  @JsonValue('moving')
  moving,
  @JsonValue('grabbing')
  grabbing,
  @JsonValue('jumping')
  jumping,
}

extension CharacterModelExtension on CharacterModel {
  Position getNextPosition() {
    switch (direction) {
      case GameConstants.directionUp:
        return Position(x: position.x, y: position.y - 1);
      case GameConstants.directionDown:
        return Position(x: position.x, y: position.y + 1);
      case GameConstants.directionLeft:
        return Position(x: position.x - 1, y: position.y);
      case GameConstants.directionRight:
        return Position(x: position.x + 1, y: position.y);
      default:
        return position;
    }
  }

  CharacterModel move() {
    return copyWith(
      position: getNextPosition(),
      state: CharacterState.moving,
    );
  }

  CharacterModel turn(String newDirection) {
    return copyWith(direction: newDirection);
  }

  CharacterModel grab(String item) {
    return copyWith(
      inventory: [...inventory, item],
      state: CharacterState.grabbing,
    );
  }

  CharacterModel collectKey() {
    return copyWith(
      hasKey: true,
      state: CharacterState.grabbing,
    );
  }

  CharacterModel resetState() {
    return copyWith(state: CharacterState.idle);
  }
}