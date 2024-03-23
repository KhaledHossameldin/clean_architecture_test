import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
@immutable
sealed class BaseState<T> with _$BaseState<T> {
  const BaseState._();

  const factory BaseState.initial() = _InitialState;

  const factory BaseState.loading() = _LoadingState;

  const factory BaseState.success({required T data}) = _SuccessState<T>;

  const factory BaseState.error({required String message}) = _ErrorState;
}
