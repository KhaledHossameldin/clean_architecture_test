import 'package:freezed_annotation/freezed_annotation.dart';

part 'number_trivia.freezed.dart';

@freezed
class NumberTrivia with _$NumberTrivia {
  const factory NumberTrivia({
    required String text,
    required int number,
  }) = _NumberTrivia;
}
