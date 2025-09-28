import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';
part 'position.g.dart';

@freezed
class Position with _$Position {
  const factory Position({
    required int x,
    required int y,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

extension PositionExtension on Position {
  bool isValid(int width, int height) {
    return x >= 0 && x < width && y >= 0 && y < height;
  }

  double distanceTo(Position other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return (dx * dx + dy * dy).toDouble();
  }

  Position add(Position other) {
    return Position(x: x + other.x, y: y + other.y);
  }

  Position subtract(Position other) {
    return Position(x: x - other.x, y: y - other.y);
  }

  List<Position> getAdjacentPositions() {
    return [
      Position(x: x, y: y - 1), // Up
      Position(x: x, y: y + 1), // Down
      Position(x: x - 1, y: y), // Left
      Position(x: x + 1, y: y), // Right
    ];
  }

  bool isAdjacent(Position other) {
    final dx = (x - other.x).abs();
    final dy = (y - other.y).abs();
    return (dx == 1 && dy == 0) || (dx == 0 && dy == 1);
  }
}