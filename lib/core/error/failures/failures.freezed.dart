// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? invalidInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) server,
    required TResult Function(_CacheFailure value) cache,
    required TResult Function(_InvalidInputFailure value) invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? server,
    TResult? Function(_CacheFailure value)? cache,
    TResult? Function(_InvalidInputFailure value)? invalidInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? server,
    TResult Function(_CacheFailure value)? cache,
    TResult Function(_InvalidInputFailure value)? invalidInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerFailureImpl extends _ServerFailure {
  const _$ServerFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.server()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() invalidInput,
  }) {
    return server();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? invalidInput,
  }) {
    return server?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? invalidInput,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) server,
    required TResult Function(_CacheFailure value) cache,
    required TResult Function(_InvalidInputFailure value) invalidInput,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? server,
    TResult? Function(_CacheFailure value)? cache,
    TResult? Function(_InvalidInputFailure value)? invalidInput,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? server,
    TResult Function(_CacheFailure value)? cache,
    TResult Function(_InvalidInputFailure value)? invalidInput,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure extends Failure {
  const factory _ServerFailure() = _$ServerFailureImpl;
  const _ServerFailure._() : super._();
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
          _$CacheFailureImpl value, $Res Function(_$CacheFailureImpl) then) =
      __$$CacheFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
      _$CacheFailureImpl _value, $Res Function(_$CacheFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CacheFailureImpl extends _CacheFailure {
  const _$CacheFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.cache()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CacheFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() invalidInput,
  }) {
    return cache();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? invalidInput,
  }) {
    return cache?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? invalidInput,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) server,
    required TResult Function(_CacheFailure value) cache,
    required TResult Function(_InvalidInputFailure value) invalidInput,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? server,
    TResult? Function(_CacheFailure value)? cache,
    TResult? Function(_InvalidInputFailure value)? invalidInput,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? server,
    TResult Function(_CacheFailure value)? cache,
    TResult Function(_InvalidInputFailure value)? invalidInput,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class _CacheFailure extends Failure {
  const factory _CacheFailure() = _$CacheFailureImpl;
  const _CacheFailure._() : super._();
}

/// @nodoc
abstract class _$$InvalidInputFailureImplCopyWith<$Res> {
  factory _$$InvalidInputFailureImplCopyWith(_$InvalidInputFailureImpl value,
          $Res Function(_$InvalidInputFailureImpl) then) =
      __$$InvalidInputFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidInputFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidInputFailureImpl>
    implements _$$InvalidInputFailureImplCopyWith<$Res> {
  __$$InvalidInputFailureImplCopyWithImpl(_$InvalidInputFailureImpl _value,
      $Res Function(_$InvalidInputFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InvalidInputFailureImpl extends _InvalidInputFailure {
  const _$InvalidInputFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.invalidInput()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidInputFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() server,
    required TResult Function() cache,
    required TResult Function() invalidInput,
  }) {
    return invalidInput();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? server,
    TResult? Function()? cache,
    TResult? Function()? invalidInput,
  }) {
    return invalidInput?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? server,
    TResult Function()? cache,
    TResult Function()? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerFailure value) server,
    required TResult Function(_CacheFailure value) cache,
    required TResult Function(_InvalidInputFailure value) invalidInput,
  }) {
    return invalidInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerFailure value)? server,
    TResult? Function(_CacheFailure value)? cache,
    TResult? Function(_InvalidInputFailure value)? invalidInput,
  }) {
    return invalidInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerFailure value)? server,
    TResult Function(_CacheFailure value)? cache,
    TResult Function(_InvalidInputFailure value)? invalidInput,
    required TResult orElse(),
  }) {
    if (invalidInput != null) {
      return invalidInput(this);
    }
    return orElse();
  }
}

abstract class _InvalidInputFailure extends Failure {
  const factory _InvalidInputFailure() = _$InvalidInputFailureImpl;
  const _InvalidInputFailure._() : super._();
}
