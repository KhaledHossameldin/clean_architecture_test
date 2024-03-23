import 'package:dio/dio.dart';

import '../../../../core/error/exceptions/exceptions.dart';
import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final Dio dio;
  NumberTriviaRemoteDataSourceImpl({required this.dio});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async =>
      await _getNumberTriviaFromUrl('/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    return await _getNumberTriviaFromUrl('/random');
  }

  Future<NumberTriviaModel> _getNumberTriviaFromUrl(String url) async {
    final response = await dio.get<Map<String, dynamic>>(url);
    if (response.statusCode != 200) {
      throw const AppException.server();
    }
    return NumberTriviaModel.fromJson(response.data!);
  }
}
