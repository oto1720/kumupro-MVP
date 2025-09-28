// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return _CharacterModel.fromJson(json);
}

/// @nodoc
mixin _$CharacterModel {
  Position get position => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  bool get hasKey => throw _privateConstructorUsedError;
  List<String> get inventory => throw _privateConstructorUsedError;
  CharacterState get state => throw _privateConstructorUsedError;

  /// Serializes this CharacterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
    CharacterModel value,
    $Res Function(CharacterModel) then,
  ) = _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call({
    Position position,
    String direction,
    bool hasKey,
    List<String> inventory,
    CharacterState state,
  });

  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? direction = null,
    Object? hasKey = null,
    Object? inventory = null,
    Object? state = null,
  }) {
    return _then(
      _value.copyWith(
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as Position,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String,
            hasKey: null == hasKey
                ? _value.hasKey
                : hasKey // ignore: cast_nullable_to_non_nullable
                      as bool,
            inventory: null == inventory
                ? _value.inventory
                : inventory // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as CharacterState,
          )
          as $Val,
    );
  }

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterModelImplCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$CharacterModelImplCopyWith(
    _$CharacterModelImpl value,
    $Res Function(_$CharacterModelImpl) then,
  ) = __$$CharacterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Position position,
    String direction,
    bool hasKey,
    List<String> inventory,
    CharacterState state,
  });

  @override
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$CharacterModelImplCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$CharacterModelImpl>
    implements _$$CharacterModelImplCopyWith<$Res> {
  __$$CharacterModelImplCopyWithImpl(
    _$CharacterModelImpl _value,
    $Res Function(_$CharacterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? direction = null,
    Object? hasKey = null,
    Object? inventory = null,
    Object? state = null,
  }) {
    return _then(
      _$CharacterModelImpl(
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as Position,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String,
        hasKey: null == hasKey
            ? _value.hasKey
            : hasKey // ignore: cast_nullable_to_non_nullable
                  as bool,
        inventory: null == inventory
            ? _value._inventory
            : inventory // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as CharacterState,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterModelImpl implements _CharacterModel {
  const _$CharacterModelImpl({
    required this.position,
    required this.direction,
    this.hasKey = false,
    final List<String> inventory = const [],
    this.state = CharacterState.idle,
  }) : _inventory = inventory;

  factory _$CharacterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterModelImplFromJson(json);

  @override
  final Position position;
  @override
  final String direction;
  @override
  @JsonKey()
  final bool hasKey;
  final List<String> _inventory;
  @override
  @JsonKey()
  List<String> get inventory {
    if (_inventory is EqualUnmodifiableListView) return _inventory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inventory);
  }

  @override
  @JsonKey()
  final CharacterState state;

  @override
  String toString() {
    return 'CharacterModel(position: $position, direction: $direction, hasKey: $hasKey, inventory: $inventory, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterModelImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.hasKey, hasKey) || other.hasKey == hasKey) &&
            const DeepCollectionEquality().equals(
              other._inventory,
              _inventory,
            ) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    position,
    direction,
    hasKey,
    const DeepCollectionEquality().hash(_inventory),
    state,
  );

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      __$$CharacterModelImplCopyWithImpl<_$CharacterModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterModelImplToJson(this);
  }
}

abstract class _CharacterModel implements CharacterModel {
  const factory _CharacterModel({
    required final Position position,
    required final String direction,
    final bool hasKey,
    final List<String> inventory,
    final CharacterState state,
  }) = _$CharacterModelImpl;

  factory _CharacterModel.fromJson(Map<String, dynamic> json) =
      _$CharacterModelImpl.fromJson;

  @override
  Position get position;
  @override
  String get direction;
  @override
  bool get hasKey;
  @override
  List<String> get inventory;
  @override
  CharacterState get state;

  /// Create a copy of CharacterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
