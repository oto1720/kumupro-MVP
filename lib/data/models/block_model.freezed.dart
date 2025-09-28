// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BlockModel _$BlockModelFromJson(Map<String, dynamic> json) {
  return _BlockModel.fromJson(json);
}

/// @nodoc
mixin _$BlockModel {
  String get id => throw _privateConstructorUsedError;
  BlockType get type => throw _privateConstructorUsedError;
  List<CardModel> get cards => throw _privateConstructorUsedError;
  int get repeatCount => throw _privateConstructorUsedError;
  String? get condition => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this BlockModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BlockModelCopyWith<BlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockModelCopyWith<$Res> {
  factory $BlockModelCopyWith(
    BlockModel value,
    $Res Function(BlockModel) then,
  ) = _$BlockModelCopyWithImpl<$Res, BlockModel>;
  @useResult
  $Res call({
    String id,
    BlockType type,
    List<CardModel> cards,
    int repeatCount,
    String? condition,
    double confidence,
  });
}

/// @nodoc
class _$BlockModelCopyWithImpl<$Res, $Val extends BlockModel>
    implements $BlockModelCopyWith<$Res> {
  _$BlockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? cards = null,
    Object? repeatCount = null,
    Object? condition = freezed,
    Object? confidence = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as BlockType,
            cards: null == cards
                ? _value.cards
                : cards // ignore: cast_nullable_to_non_nullable
                      as List<CardModel>,
            repeatCount: null == repeatCount
                ? _value.repeatCount
                : repeatCount // ignore: cast_nullable_to_non_nullable
                      as int,
            condition: freezed == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String?,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BlockModelImplCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory _$$BlockModelImplCopyWith(
    _$BlockModelImpl value,
    $Res Function(_$BlockModelImpl) then,
  ) = __$$BlockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    BlockType type,
    List<CardModel> cards,
    int repeatCount,
    String? condition,
    double confidence,
  });
}

/// @nodoc
class __$$BlockModelImplCopyWithImpl<$Res>
    extends _$BlockModelCopyWithImpl<$Res, _$BlockModelImpl>
    implements _$$BlockModelImplCopyWith<$Res> {
  __$$BlockModelImplCopyWithImpl(
    _$BlockModelImpl _value,
    $Res Function(_$BlockModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? cards = null,
    Object? repeatCount = null,
    Object? condition = freezed,
    Object? confidence = null,
  }) {
    return _then(
      _$BlockModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as BlockType,
        cards: null == cards
            ? _value._cards
            : cards // ignore: cast_nullable_to_non_nullable
                  as List<CardModel>,
        repeatCount: null == repeatCount
            ? _value.repeatCount
            : repeatCount // ignore: cast_nullable_to_non_nullable
                  as int,
        condition: freezed == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String?,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockModelImpl implements _BlockModel {
  const _$BlockModelImpl({
    required this.id,
    required this.type,
    final List<CardModel> cards = const [],
    this.repeatCount = 1,
    this.condition,
    this.confidence = 0.0,
  }) : _cards = cards;

  factory _$BlockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockModelImplFromJson(json);

  @override
  final String id;
  @override
  final BlockType type;
  final List<CardModel> _cards;
  @override
  @JsonKey()
  List<CardModel> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  @JsonKey()
  final int repeatCount;
  @override
  final String? condition;
  @override
  @JsonKey()
  final double confidence;

  @override
  String toString() {
    return 'BlockModel(id: $id, type: $type, cards: $cards, repeatCount: $repeatCount, condition: $condition, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.repeatCount, repeatCount) ||
                other.repeatCount == repeatCount) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    const DeepCollectionEquality().hash(_cards),
    repeatCount,
    condition,
    confidence,
  );

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockModelImplCopyWith<_$BlockModelImpl> get copyWith =>
      __$$BlockModelImplCopyWithImpl<_$BlockModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockModelImplToJson(this);
  }
}

abstract class _BlockModel implements BlockModel {
  const factory _BlockModel({
    required final String id,
    required final BlockType type,
    final List<CardModel> cards,
    final int repeatCount,
    final String? condition,
    final double confidence,
  }) = _$BlockModelImpl;

  factory _BlockModel.fromJson(Map<String, dynamic> json) =
      _$BlockModelImpl.fromJson;

  @override
  String get id;
  @override
  BlockType get type;
  @override
  List<CardModel> get cards;
  @override
  int get repeatCount;
  @override
  String? get condition;
  @override
  double get confidence;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BlockModelImplCopyWith<_$BlockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
