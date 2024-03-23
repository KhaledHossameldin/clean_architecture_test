import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
@immutable
abstract class Failure with _$Failure {
  const Failure._();

  const factory Failure.server() = _ServerFailure;

  const factory Failure.cache() = _CacheFailure;

  const factory Failure.invalidInput() = _InvalidInputFailure;
}
