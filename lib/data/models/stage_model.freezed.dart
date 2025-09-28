// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StageModel _$StageModelFromJson(Map<String, dynamic> json) {
  return _StageModel.fromJson(json);
}

/// @nodoc
mixin _$StageModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  List<List<String>> get grid => throw _privateConstructorUsedError;
  Position get startPosition => throw _privateConstructorUsedError;
  Position get goalPosition => throw _privateConstructorUsedError;
  List<Position> get keyPositions => throw _privateConstructorUsedError;
  List<Position> get wallPositions => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get bestScore => throw _privateConstructorUsedError;

  /// Serializes this StageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StageModelCopyWith<StageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageModelCopyWith<$Res> {
  factory $StageModelCopyWith(
    StageModel value,
    $Res Function(StageModel) then,
  ) = _$StageModelCopyWithImpl<$Res, StageModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    int width,
    int height,
    List<List<String>> grid,
    Position startPosition,
    Position goalPosition,
    List<Position> keyPositions,
    List<Position> wallPositions,
    int difficulty,
    bool isCompleted,
    int bestScore,
  });

  $PositionCopyWith<$Res> get startPosition;
  $PositionCopyWith<$Res> get goalPosition;
}

/// @nodoc
class _$StageModelCopyWithImpl<$Res, $Val extends StageModel>
    implements $StageModelCopyWith<$Res> {
  _$StageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? width = null,
    Object? height = null,
    Object? grid = null,
    Object? startPosition = null,
    Object? goalPosition = null,
    Object? keyPositions = null,
    Object? wallPositions = null,
    Object? difficulty = null,
    Object? isCompleted = null,
    Object? bestScore = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            grid: null == grid
                ? _value.grid
                : grid // ignore: cast_nullable_to_non_nullable
                      as List<List<String>>,
            startPosition: null == startPosition
                ? _value.startPosition
                : startPosition // ignore: cast_nullable_to_non_nullable
                      as Position,
            goalPosition: null == goalPosition
                ? _value.goalPosition
                : goalPosition // ignore: cast_nullable_to_non_nullable
                      as Position,
            keyPositions: null == keyPositions
                ? _value.keyPositions
                : keyPositions // ignore: cast_nullable_to_non_nullable
                      as List<Position>,
            wallPositions: null == wallPositions
                ? _value.wallPositions
                : wallPositions // ignore: cast_nullable_to_non_nullable
                      as List<Position>,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            bestScore: null == bestScore
                ? _value.bestScore
                : bestScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get startPosition {
    return $PositionCopyWith<$Res>(_value.startPosition, (value) {
      return _then(_value.copyWith(startPosition: value) as $Val);
    });
  }

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get goalPosition {
    return $PositionCopyWith<$Res>(_value.goalPosition, (value) {
      return _then(_value.copyWith(goalPosition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StageModelImplCopyWith<$Res>
    implements $StageModelCopyWith<$Res> {
  factory _$$StageModelImplCopyWith(
    _$StageModelImpl value,
    $Res Function(_$StageModelImpl) then,
  ) = __$$StageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    int width,
    int height,
    List<List<String>> grid,
    Position startPosition,
    Position goalPosition,
    List<Position> keyPositions,
    List<Position> wallPositions,
    int difficulty,
    bool isCompleted,
    int bestScore,
  });

  @override
  $PositionCopyWith<$Res> get startPosition;
  @override
  $PositionCopyWith<$Res> get goalPosition;
}

/// @nodoc
class __$$StageModelImplCopyWithImpl<$Res>
    extends _$StageModelCopyWithImpl<$Res, _$StageModelImpl>
    implements _$$StageModelImplCopyWith<$Res> {
  __$$StageModelImplCopyWithImpl(
    _$StageModelImpl _value,
    $Res Function(_$StageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? width = null,
    Object? height = null,
    Object? grid = null,
    Object? startPosition = null,
    Object? goalPosition = null,
    Object? keyPositions = null,
    Object? wallPositions = null,
    Object? difficulty = null,
    Object? isCompleted = null,
    Object? bestScore = null,
  }) {
    return _then(
      _$StageModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        grid: null == grid
            ? _value._grid
            : grid // ignore: cast_nullable_to_non_nullable
                  as List<List<String>>,
        startPosition: null == startPosition
            ? _value.startPosition
            : startPosition // ignore: cast_nullable_to_non_nullable
                  as Position,
        goalPosition: null == goalPosition
            ? _value.goalPosition
            : goalPosition // ignore: cast_nullable_to_non_nullable
                  as Position,
        keyPositions: null == keyPositions
            ? _value._keyPositions
            : keyPositions // ignore: cast_nullable_to_non_nullable
                  as List<Position>,
        wallPositions: null == wallPositions
            ? _value._wallPositions
            : wallPositions // ignore: cast_nullable_to_non_nullable
                  as List<Position>,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        bestScore: null == bestScore
            ? _value.bestScore
            : bestScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StageModelImpl implements _StageModel {
  const _$StageModelImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.width,
    required this.height,
    required final List<List<String>> grid,
    required this.startPosition,
    required this.goalPosition,
    final List<Position> keyPositions = const [],
    final List<Position> wallPositions = const [],
    this.difficulty = 1,
    this.isCompleted = false,
    this.bestScore = 0,
  }) : _grid = grid,
       _keyPositions = keyPositions,
       _wallPositions = wallPositions;

  factory _$StageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int width;
  @override
  final int height;
  final List<List<String>> _grid;
  @override
  List<List<String>> get grid {
    if (_grid is EqualUnmodifiableListView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grid);
  }

  @override
  final Position startPosition;
  @override
  final Position goalPosition;
  final List<Position> _keyPositions;
  @override
  @JsonKey()
  List<Position> get keyPositions {
    if (_keyPositions is EqualUnmodifiableListView) return _keyPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyPositions);
  }

  final List<Position> _wallPositions;
  @override
  @JsonKey()
  List<Position> get wallPositions {
    if (_wallPositions is EqualUnmodifiableListView) return _wallPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallPositions);
  }

  @override
  @JsonKey()
  final int difficulty;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final int bestScore;

  @override
  String toString() {
    return 'StageModel(id: $id, name: $name, description: $description, width: $width, height: $height, grid: $grid, startPosition: $startPosition, goalPosition: $goalPosition, keyPositions: $keyPositions, wallPositions: $wallPositions, difficulty: $difficulty, isCompleted: $isCompleted, bestScore: $bestScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(other._grid, _grid) &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition) &&
            (identical(other.goalPosition, goalPosition) ||
                other.goalPosition == goalPosition) &&
            const DeepCollectionEquality().equals(
              other._keyPositions,
              _keyPositions,
            ) &&
            const DeepCollectionEquality().equals(
              other._wallPositions,
              _wallPositions,
            ) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.bestScore, bestScore) ||
                other.bestScore == bestScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    width,
    height,
    const DeepCollectionEquality().hash(_grid),
    startPosition,
    goalPosition,
    const DeepCollectionEquality().hash(_keyPositions),
    const DeepCollectionEquality().hash(_wallPositions),
    difficulty,
    isCompleted,
    bestScore,
  );

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StageModelImplCopyWith<_$StageModelImpl> get copyWith =>
      __$$StageModelImplCopyWithImpl<_$StageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StageModelImplToJson(this);
  }
}

abstract class _StageModel implements StageModel {
  const factory _StageModel({
    required final String id,
    required final String name,
    required final String description,
    required final int width,
    required final int height,
    required final List<List<String>> grid,
    required final Position startPosition,
    required final Position goalPosition,
    final List<Position> keyPositions,
    final List<Position> wallPositions,
    final int difficulty,
    final bool isCompleted,
    final int bestScore,
  }) = _$StageModelImpl;

  factory _StageModel.fromJson(Map<String, dynamic> json) =
      _$StageModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get width;
  @override
  int get height;
  @override
  List<List<String>> get grid;
  @override
  Position get startPosition;
  @override
  Position get goalPosition;
  @override
  List<Position> get keyPositions;
  @override
  List<Position> get wallPositions;
  @override
  int get difficulty;
  @override
  bool get isCompleted;
  @override
  int get bestScore;

  /// Create a copy of StageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StageModelImplCopyWith<_$StageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StageProgressModel _$StageProgressModelFromJson(Map<String, dynamic> json) {
  return _StageProgressModel.fromJson(json);
}

/// @nodoc
mixin _$StageProgressModel {
  String get stageId => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;
  int get bestCommandCount => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get lastAttemptAt => throw _privateConstructorUsedError;

  /// Serializes this StageProgressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StageProgressModelCopyWith<StageProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageProgressModelCopyWith<$Res> {
  factory $StageProgressModelCopyWith(
    StageProgressModel value,
    $Res Function(StageProgressModel) then,
  ) = _$StageProgressModelCopyWithImpl<$Res, StageProgressModel>;
  @useResult
  $Res call({
    String stageId,
    bool isCompleted,
    int attempts,
    int bestCommandCount,
    DateTime? completedAt,
    DateTime lastAttemptAt,
  });
}

/// @nodoc
class _$StageProgressModelCopyWithImpl<$Res, $Val extends StageProgressModel>
    implements $StageProgressModelCopyWith<$Res> {
  _$StageProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageId = null,
    Object? isCompleted = null,
    Object? attempts = null,
    Object? bestCommandCount = null,
    Object? completedAt = freezed,
    Object? lastAttemptAt = null,
  }) {
    return _then(
      _value.copyWith(
            stageId: null == stageId
                ? _value.stageId
                : stageId // ignore: cast_nullable_to_non_nullable
                      as String,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            attempts: null == attempts
                ? _value.attempts
                : attempts // ignore: cast_nullable_to_non_nullable
                      as int,
            bestCommandCount: null == bestCommandCount
                ? _value.bestCommandCount
                : bestCommandCount // ignore: cast_nullable_to_non_nullable
                      as int,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastAttemptAt: null == lastAttemptAt
                ? _value.lastAttemptAt
                : lastAttemptAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StageProgressModelImplCopyWith<$Res>
    implements $StageProgressModelCopyWith<$Res> {
  factory _$$StageProgressModelImplCopyWith(
    _$StageProgressModelImpl value,
    $Res Function(_$StageProgressModelImpl) then,
  ) = __$$StageProgressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String stageId,
    bool isCompleted,
    int attempts,
    int bestCommandCount,
    DateTime? completedAt,
    DateTime lastAttemptAt,
  });
}

/// @nodoc
class __$$StageProgressModelImplCopyWithImpl<$Res>
    extends _$StageProgressModelCopyWithImpl<$Res, _$StageProgressModelImpl>
    implements _$$StageProgressModelImplCopyWith<$Res> {
  __$$StageProgressModelImplCopyWithImpl(
    _$StageProgressModelImpl _value,
    $Res Function(_$StageProgressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageId = null,
    Object? isCompleted = null,
    Object? attempts = null,
    Object? bestCommandCount = null,
    Object? completedAt = freezed,
    Object? lastAttemptAt = null,
  }) {
    return _then(
      _$StageProgressModelImpl(
        stageId: null == stageId
            ? _value.stageId
            : stageId // ignore: cast_nullable_to_non_nullable
                  as String,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        attempts: null == attempts
            ? _value.attempts
            : attempts // ignore: cast_nullable_to_non_nullable
                  as int,
        bestCommandCount: null == bestCommandCount
            ? _value.bestCommandCount
            : bestCommandCount // ignore: cast_nullable_to_non_nullable
                  as int,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastAttemptAt: null == lastAttemptAt
            ? _value.lastAttemptAt
            : lastAttemptAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StageProgressModelImpl implements _StageProgressModel {
  const _$StageProgressModelImpl({
    required this.stageId,
    required this.isCompleted,
    required this.attempts,
    required this.bestCommandCount,
    required this.completedAt,
    required this.lastAttemptAt,
  });

  factory _$StageProgressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageProgressModelImplFromJson(json);

  @override
  final String stageId;
  @override
  final bool isCompleted;
  @override
  final int attempts;
  @override
  final int bestCommandCount;
  @override
  final DateTime? completedAt;
  @override
  final DateTime lastAttemptAt;

  @override
  String toString() {
    return 'StageProgressModel(stageId: $stageId, isCompleted: $isCompleted, attempts: $attempts, bestCommandCount: $bestCommandCount, completedAt: $completedAt, lastAttemptAt: $lastAttemptAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageProgressModelImpl &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts) &&
            (identical(other.bestCommandCount, bestCommandCount) ||
                other.bestCommandCount == bestCommandCount) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.lastAttemptAt, lastAttemptAt) ||
                other.lastAttemptAt == lastAttemptAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stageId,
    isCompleted,
    attempts,
    bestCommandCount,
    completedAt,
    lastAttemptAt,
  );

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StageProgressModelImplCopyWith<_$StageProgressModelImpl> get copyWith =>
      __$$StageProgressModelImplCopyWithImpl<_$StageProgressModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StageProgressModelImplToJson(this);
  }
}

abstract class _StageProgressModel implements StageProgressModel {
  const factory _StageProgressModel({
    required final String stageId,
    required final bool isCompleted,
    required final int attempts,
    required final int bestCommandCount,
    required final DateTime? completedAt,
    required final DateTime lastAttemptAt,
  }) = _$StageProgressModelImpl;

  factory _StageProgressModel.fromJson(Map<String, dynamic> json) =
      _$StageProgressModelImpl.fromJson;

  @override
  String get stageId;
  @override
  bool get isCompleted;
  @override
  int get attempts;
  @override
  int get bestCommandCount;
  @override
  DateTime? get completedAt;
  @override
  DateTime get lastAttemptAt;

  /// Create a copy of StageProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StageProgressModelImplCopyWith<_$StageProgressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
