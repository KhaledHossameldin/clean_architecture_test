// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NumberTriviaModelImpl _$$NumberTriviaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NumberTriviaModelImpl(
      text: json['text'] as String,
      number: const _NumberConverter().fromJson(json['number'] as num),
    );

Map<String, dynamic> _$$NumberTriviaModelImplToJson(
        _$NumberTriviaModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': const _NumberConverter().toJson(instance.number),
    };
