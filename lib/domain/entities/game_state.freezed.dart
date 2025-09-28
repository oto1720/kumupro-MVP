// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  StageModel get currentStage => throw _privateConstructorUsedError;
  CharacterModel get character => throw _privateConstructorUsedError;
  List<CardModel> get recognizedCards => throw _privateConstructorUsedError;
  List<BlockModel> get recognizedBlocks => throw _privateConstructorUsedError;
  List<String> get executionLog => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  int get currentCommandIndex => throw _privateConstructorUsedError;
  int get commandsExecuted => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({
    StageModel currentStage,
    CharacterModel character,
    List<CardModel> recognizedCards,
    List<BlockModel> recognizedBlocks,
    List<String> executionLog,
    GameStatus status,
    int currentCommandIndex,
    int commandsExecuted,
    String? errorMessage,
  });

  $StageModelCopyWith<$Res> get currentStage;
  $CharacterModelCopyWith<$Res> get character;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStage = null,
    Object? character = null,
    Object? recognizedCards = null,
    Object? recognizedBlocks = null,
    Object? executionLog = null,
    Object? status = null,
    Object? currentCommandIndex = null,
    Object? commandsExecuted = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentStage: null == currentStage
                ? _value.currentStage
                : currentStage // ignore: cast_nullable_to_non_nullable
                      as StageModel,
            character: null == character
                ? _value.character
                : character // ignore: cast_nullable_to_non_nullable
                      as CharacterModel,
            recognizedCards: null == recognizedCards
                ? _value.recognizedCards
                : recognizedCards // ignore: cast_nullable_to_non_nullable
                      as List<CardModel>,
            recognizedBlocks: null == recognizedBlocks
                ? _value.recognizedBlocks
                : recognizedBlocks // ignore: cast_nullable_to_non_nullable
                      as List<BlockModel>,
            executionLog: null == executionLog
                ? _value.executionLog
                : executionLog // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GameStatus,
            currentCommandIndex: null == currentCommandIndex
                ? _value.currentCommandIndex
                : currentCommandIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            commandsExecuted: null == commandsExecuted
                ? _value.commandsExecuted
                : commandsExecuted // ignore: cast_nullable_to_non_nullable
                      as int,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StageModelCopyWith<$Res> get currentStage {
    return $StageModelCopyWith<$Res>(_value.currentStage, (value) {
      return _then(_value.copyWith(currentStage: value) as $Val);
    });
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterModelCopyWith<$Res> get character {
    return $CharacterModelCopyWith<$Res>(_value.character, (value) {
      return _then(_value.copyWith(character: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
    _$GameStateImpl value,
    $Res Function(_$GameStateImpl) then,
  ) = __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    StageModel currentStage,
    CharacterModel character,
    List<CardModel> recognizedCards,
    List<BlockModel> recognizedBlocks,
    List<String> executionLog,
    GameStatus status,
    int currentCommandIndex,
    int commandsExecuted,
    String? errorMessage,
  });

  @override
  $StageModelCopyWith<$Res> get currentStage;
  @override
  $CharacterModelCopyWith<$Res> get character;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
    _$GameStateImpl _value,
    $Res Function(_$GameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStage = null,
    Object? character = null,
    Object? recognizedCards = null,
    Object? recognizedBlocks = null,
    Object? executionLog = null,
    Object? status = null,
    Object? currentCommandIndex = null,
    Object? commandsExecuted = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$GameStateImpl(
        currentStage: null == currentStage
            ? _value.currentStage
            : currentStage // ignore: cast_nullable_to_non_nullable
                  as StageModel,
        character: null == character
            ? _value.character
            : character // ignore: cast_nullable_to_non_nullable
                  as CharacterModel,
        recognizedCards: null == recognizedCards
            ? _value._recognizedCards
            : recognizedCards // ignore: cast_nullable_to_non_nullable
                  as List<CardModel>,
        recognizedBlocks: null == recognizedBlocks
            ? _value._recognizedBlocks
            : recognizedBlocks // ignore: cast_nullable_to_non_nullable
                  as List<BlockModel>,
        executionLog: null == executionLog
            ? _value._executionLog
            : executionLog // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GameStatus,
        currentCommandIndex: null == currentCommandIndex
            ? _value.currentCommandIndex
            : currentCommandIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        commandsExecuted: null == commandsExecuted
            ? _value.commandsExecuted
            : commandsExecuted // ignore: cast_nullable_to_non_nullable
                  as int,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl implements _GameState {
  const _$GameStateImpl({
    required this.currentStage,
    required this.character,
    final List<CardModel> recognizedCards = const [],
    final List<BlockModel> recognizedBlocks = const [],
    final List<String> executionLog = const [],
    this.status = GameStatus.idle,
    this.currentCommandIndex = 0,
    this.commandsExecuted = 0,
    this.errorMessage,
  }) : _recognizedCards = recognizedCards,
       _recognizedBlocks = recognizedBlocks,
       _executionLog = executionLog;

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  final StageModel currentStage;
  @override
  final CharacterModel character;
  final List<CardModel> _recognizedCards;
  @override
  @JsonKey()
  List<CardModel> get recognizedCards {
    if (_recognizedCards is EqualUnmodifiableListView) return _recognizedCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recognizedCards);
  }

  final List<BlockModel> _recognizedBlocks;
  @override
  @JsonKey()
  List<BlockModel> get recognizedBlocks {
    if (_recognizedBlocks is EqualUnmodifiableListView)
      return _recognizedBlocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recognizedBlocks);
  }

  final List<String> _executionLog;
  @override
  @JsonKey()
  List<String> get executionLog {
    if (_executionLog is EqualUnmodifiableListView) return _executionLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_executionLog);
  }

  @override
  @JsonKey()
  final GameStatus status;
  @override
  @JsonKey()
  final int currentCommandIndex;
  @override
  @JsonKey()
  final int commandsExecuted;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GameState(currentStage: $currentStage, character: $character, recognizedCards: $recognizedCards, recognizedBlocks: $recognizedBlocks, executionLog: $executionLog, status: $status, currentCommandIndex: $currentCommandIndex, commandsExecuted: $commandsExecuted, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.currentStage, currentStage) ||
                other.currentStage == currentStage) &&
            (identical(other.character, character) ||
                other.character == character) &&
            const DeepCollectionEquality().equals(
              other._recognizedCards,
              _recognizedCards,
            ) &&
            const DeepCollectionEquality().equals(
              other._recognizedBlocks,
              _recognizedBlocks,
            ) &&
            const DeepCollectionEquality().equals(
              other._executionLog,
              _executionLog,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentCommandIndex, currentCommandIndex) ||
                other.currentCommandIndex == currentCommandIndex) &&
            (identical(other.commandsExecuted, commandsExecuted) ||
                other.commandsExecuted == commandsExecuted) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStage,
    character,
    const DeepCollectionEquality().hash(_recognizedCards),
    const DeepCollectionEquality().hash(_recognizedBlocks),
    const DeepCollectionEquality().hash(_executionLog),
    status,
    currentCommandIndex,
    commandsExecuted,
    errorMessage,
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(this);
  }
}

abstract class _GameState implements GameState {
  const factory _GameState({
    required final StageModel currentStage,
    required final CharacterModel character,
    final List<CardModel> recognizedCards,
    final List<BlockModel> recognizedBlocks,
    final List<String> executionLog,
    final GameStatus status,
    final int currentCommandIndex,
    final int commandsExecuted,
    final String? errorMessage,
  }) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  StageModel get currentStage;
  @override
  CharacterModel get character;
  @override
  List<CardModel> get recognizedCards;
  @override
  List<BlockModel> get recognizedBlocks;
  @override
  List<String> get executionLog;
  @override
  GameStatus get status;
  @override
  int get currentCommandIndex;
  @override
  int get commandsExecuted;
  @override
  String? get errorMessage;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
