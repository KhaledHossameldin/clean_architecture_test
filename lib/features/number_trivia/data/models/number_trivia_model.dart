import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/number_trivia.dart';

part 'number_trivia_model.freezed.dart';
part 'number_trivia_model.g.dart';

@freezed
class NumberTriviaModel with _$NumberTriviaModel {
  const NumberTriviaModel._();
  const factory NumberTriviaModel({
    required String text,
    @_NumberConverter() required int number,
  }) = _NumberTriviaModel;

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);

  NumberTrivia toEntity() => NumberTrivia(text: text, number: number);
}

class _NumberConverter implements JsonConverter<int, num> {
  const _NumberConverter();
  @override
  int fromJson(num json) {
    return json.toInt();
  }

  @override
  num toJson(int object) {
    return object;
  }
}
