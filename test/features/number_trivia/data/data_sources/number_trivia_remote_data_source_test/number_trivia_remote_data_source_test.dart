import 'dart:convert';

import 'package:clean_architecture/core/error/exceptions/exceptions.dart';
import 'package:clean_architecture/features/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late NumberTriviaRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    mockDio.options = BaseOptions(
      baseUrl: 'http://numbersapi.com',
      responseType: ResponseType.json,
      contentType: 'application/json',
    );
    dataSource = NumberTriviaRemoteDataSourceImpl(dio: mockDio);
  });

  void setUpMockDioSuccess200() {
    when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: ''),
        data: json.decode(fixture('trivia.json')),
        statusCode: 200,
      ),
    );
  }

  void setUpMockDioFailure404() {
    when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        requestOptions: RequestOptions(path: ''),
        data: json.decode(fixture('trivia.json')),
        statusCode: 404,
      ),
    );
  }

  group('getConcreteNumberTrivia', () {
    const tNumber = 1;
    final tNumberTriviaModel = NumberTriviaModel.fromJson(
      json.decode(fixture('trivia.json')),
    );

    test(
      'should perform a GET request on a URL with number being the endpoint and with application/json header',
      () async {
        // arrange
        setUpMockDioSuccess200();
        // act
        dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        verify(mockDio.get('/$tNumber'));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockDioSuccess200();
        // act
        final result = await dataSource.getConcreteNumberTrivia(tNumber);
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockDioFailure404();
        // act
        final call = dataSource.getConcreteNumberTrivia;
        // assert
        expect(
          () => call(tNumber),
          throwsA(
            isA<AppException>().having(
              (e) => e,
              'e is ServerException',
              (e) => e == const AppException.server(),
            ),
          ),
        );
      },
    );
  });

  group('getRandomNumberTrivia', () {
    final tNumberTriviaModel = NumberTriviaModel.fromJson(
      json.decode(fixture('trivia.json')),
    );

    test(
      'should perform a GET request on a URL with number being the endpoint and with application/json header',
      () async {
        // arrange
        setUpMockDioSuccess200();
        // act
        dataSource.getRandomNumberTrivia();
        // assert
        verify(mockDio.get('/random'));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockDioSuccess200();
        // act
        final result = await dataSource.getRandomNumberTrivia();
        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockDioFailure404();
        // act
        final call = dataSource.getRandomNumberTrivia;
        // assert
        expect(
          () => call(),
          throwsA(
            isA<AppException>().having(
              (e) => e,
              'e is ServerException',
              (e) => e == const AppException.server(),
            ),
          ),
        );
      },
    );
  });
}
