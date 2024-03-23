import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
@immutable
sealed class AppException with _$AppException implements Exception {
  const AppException._();

  const factory AppException.server() = _ServerException;

  const factory AppException.cache() = _CacheException;
}
