// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) indexWidget,
    required TResult Function(String? errorMsg) errorMsg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? indexWidget,
    TResult? Function(String? errorMsg)? errorMsg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? indexWidget,
    TResult Function(String? errorMsg)? errorMsg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IndexWidget value) indexWidget,
    required TResult Function(_ErrorMsg value) errorMsg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IndexWidget value)? indexWidget,
    TResult? Function(_ErrorMsg value)? errorMsg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IndexWidget value)? indexWidget,
    TResult Function(_ErrorMsg value)? errorMsg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MapState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) indexWidget,
    required TResult Function(String? errorMsg) errorMsg,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? indexWidget,
    TResult? Function(String? errorMsg)? errorMsg,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? indexWidget,
    TResult Function(String? errorMsg)? errorMsg,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IndexWidget value) indexWidget,
    required TResult Function(_ErrorMsg value) errorMsg,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IndexWidget value)? indexWidget,
    TResult? Function(_ErrorMsg value)? errorMsg,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IndexWidget value)? indexWidget,
    TResult Function(_ErrorMsg value)? errorMsg,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MapState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$IndexWidgetImplCopyWith<$Res> {
  factory _$$IndexWidgetImplCopyWith(
          _$IndexWidgetImpl value, $Res Function(_$IndexWidgetImpl) then) =
      __$$IndexWidgetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$IndexWidgetImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$IndexWidgetImpl>
    implements _$$IndexWidgetImplCopyWith<$Res> {
  __$$IndexWidgetImplCopyWithImpl(
      _$IndexWidgetImpl _value, $Res Function(_$IndexWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$IndexWidgetImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IndexWidgetImpl implements _IndexWidget {
  const _$IndexWidgetImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'MapState.indexWidget(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndexWidgetImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndexWidgetImplCopyWith<_$IndexWidgetImpl> get copyWith =>
      __$$IndexWidgetImplCopyWithImpl<_$IndexWidgetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) indexWidget,
    required TResult Function(String? errorMsg) errorMsg,
  }) {
    return indexWidget(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? indexWidget,
    TResult? Function(String? errorMsg)? errorMsg,
  }) {
    return indexWidget?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? indexWidget,
    TResult Function(String? errorMsg)? errorMsg,
    required TResult orElse(),
  }) {
    if (indexWidget != null) {
      return indexWidget(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IndexWidget value) indexWidget,
    required TResult Function(_ErrorMsg value) errorMsg,
  }) {
    return indexWidget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IndexWidget value)? indexWidget,
    TResult? Function(_ErrorMsg value)? errorMsg,
  }) {
    return indexWidget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IndexWidget value)? indexWidget,
    TResult Function(_ErrorMsg value)? errorMsg,
    required TResult orElse(),
  }) {
    if (indexWidget != null) {
      return indexWidget(this);
    }
    return orElse();
  }
}

abstract class _IndexWidget implements MapState {
  const factory _IndexWidget({required final int index}) = _$IndexWidgetImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$IndexWidgetImplCopyWith<_$IndexWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorMsgImplCopyWith<$Res> {
  factory _$$ErrorMsgImplCopyWith(
          _$ErrorMsgImpl value, $Res Function(_$ErrorMsgImpl) then) =
      __$$ErrorMsgImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg});
}

/// @nodoc
class __$$ErrorMsgImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$ErrorMsgImpl>
    implements _$$ErrorMsgImplCopyWith<$Res> {
  __$$ErrorMsgImplCopyWithImpl(
      _$ErrorMsgImpl _value, $Res Function(_$ErrorMsgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_$ErrorMsgImpl(
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorMsgImpl implements _ErrorMsg {
  const _$ErrorMsgImpl({this.errorMsg});

  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'MapState.errorMsg(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMsgImpl &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMsgImplCopyWith<_$ErrorMsgImpl> get copyWith =>
      __$$ErrorMsgImplCopyWithImpl<_$ErrorMsgImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) indexWidget,
    required TResult Function(String? errorMsg) errorMsg,
  }) {
    return errorMsg(this.errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? indexWidget,
    TResult? Function(String? errorMsg)? errorMsg,
  }) {
    return errorMsg?.call(this.errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? indexWidget,
    TResult Function(String? errorMsg)? errorMsg,
    required TResult orElse(),
  }) {
    if (errorMsg != null) {
      return errorMsg(this.errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_IndexWidget value) indexWidget,
    required TResult Function(_ErrorMsg value) errorMsg,
  }) {
    return errorMsg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_IndexWidget value)? indexWidget,
    TResult? Function(_ErrorMsg value)? errorMsg,
  }) {
    return errorMsg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_IndexWidget value)? indexWidget,
    TResult Function(_ErrorMsg value)? errorMsg,
    required TResult orElse(),
  }) {
    if (errorMsg != null) {
      return errorMsg(this);
    }
    return orElse();
  }
}

abstract class _ErrorMsg implements MapState {
  const factory _ErrorMsg({final String? errorMsg}) = _$ErrorMsgImpl;

  String? get errorMsg;
  @JsonKey(ignore: true)
  _$$ErrorMsgImplCopyWith<_$ErrorMsgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
