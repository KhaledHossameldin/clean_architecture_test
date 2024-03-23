import 'package:clean_architecture/core/bloc/base_state.dart';
import 'package:clean_architecture/core/error/failures/failures.dart';
import 'package:clean_architecture/core/utils/input_converter.dart';
import 'package:clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domain/use_cases/get_concrete_number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:clean_architecture/features/number_trivia/presentation/bloc/number_trivia_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_cubit_test.mocks.dart';

@GenerateMocks([
  GetConcreteNumberTriviaUseCase,
  GetRandomNumberTriviaUseCase,
  InputConverter,
])
void main() {
  late NumberTriviaCubit cubit;
  late MockGetConcreteNumberTriviaUseCase mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTriviaUseCase mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTriviaUseCase();
    mockGetRandomNumberTrivia = MockGetRandomNumberTriviaUseCase();
    mockInputConverter = MockInputConverter();
    cubit = NumberTriviaCubit(
      getConcreteNumberTriviaUseCase: mockGetConcreteNumberTrivia,
      getRandomNumberTriviaUseCase: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test('initial state should be [BaseState<NumberTrivia>.initial]', () {
    // assert
    expect(cubit.state, const BaseState<NumberTrivia>.initial());
  });

  group('getConcreteNumberTrivia', () {
    const tNumberString = '1';
    const tNumber = 1;
    const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

    void setUpMockInputConverterSuccess() {
      when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(
        const Right(tNumber),
      );
    }

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer',
      () async {
        // arrange
        provideDummy<Either<Failure, int>>(const Right(tNumber));
        provideDummy<Either<Failure, NumberTrivia>>(const Right(tNumberTrivia));
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any)).thenAnswer(
          (_) async => const Right(tNumberTrivia),
        );
        // act
        cubit.getConcreteNumberTrivia(tNumberString);
        // assert
        expect(cubit.state, const BaseState<NumberTrivia>.loading());
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.error] when the input is invalid',
      () async {
        // arrange
        provideDummy<Either<Failure, int>>(const Left(Failure.invalidInput()));
        when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(
          const Left(Failure.invalidInput()),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.error(
              message: INVALID_INPUT_FAILURE_MESSAGE),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getConcreteNumberTrivia(tNumberString);
      },
    );

    test(
      'should get data from the concrete use case',
      () async {
        // arrange
        provideDummy<Either<Failure, int>>(const Right(tNumber));
        provideDummy<Either<Failure, NumberTrivia>>(const Right(tNumberTrivia));
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any)).thenAnswer(
          (_) async => const Right(tNumberTrivia),
        );
        // act
        cubit.getConcreteNumberTrivia(tNumberString);
        // assert
        expect(cubit.state, const BaseState<NumberTrivia>.loading());
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.loading], [SuccessState<NumberTrivia>] when data is gotten successfully',
      () async {
        // arrange
        provideDummy<Either<Failure, int>>(const Right(tNumber));
        provideDummy<Either<Failure, NumberTrivia>>(const Right(tNumberTrivia));
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any)).thenAnswer(
          (_) async => const Right(tNumberTrivia),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.loading(),
          const BaseState<NumberTrivia>.success(data: tNumberTrivia),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getConcreteNumberTrivia(tNumberString);
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.loading], [BaseState<NumberTrivia>.error] when getting data fails',
      () async {
        // arrange
        provideDummy<Either<Failure, int>>(const Right(tNumber));
        provideDummy<Either<Failure, NumberTrivia>>(
          const Left(Failure.server()),
        );
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any)).thenAnswer(
          (_) async => const Left(Failure.server()),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.loading(),
          const BaseState<NumberTrivia>.error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getConcreteNumberTrivia(tNumberString);
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.loading], [BaseState<NumberTrivia>.error] with a proper message for the error when getting data fails',
      () async {
        // arrange
        provideDummy<Either<Failure, int>>(const Right(tNumber));
        provideDummy<Either<Failure, NumberTrivia>>(
          const Left(Failure.cache()),
        );
        setUpMockInputConverterSuccess();
        when(mockGetConcreteNumberTrivia(any)).thenAnswer(
          (_) async => const Left(Failure.cache()),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.loading(),
          const BaseState<NumberTrivia>.error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getConcreteNumberTrivia(tNumberString);
      },
    );
  });

  group('getRandomNumberTrivia', () {
    const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

    test(
      'should get data from the random use case',
      () async {
        // arrange
        provideDummy<Either<Failure, NumberTrivia>>(const Right(tNumberTrivia));
        when(mockGetRandomNumberTrivia(any)).thenAnswer(
          (_) async => const Right(tNumberTrivia),
        );
        // act
        cubit.getRandomNumberTrivia();
        // assert
        expect(cubit.state, const BaseState<NumberTrivia>.loading());
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.loading], [SuccessState<NumberTrivia>] when data is gotten successfully',
      () async {
        // arrange
        provideDummy<Either<Failure, NumberTrivia>>(const Right(tNumberTrivia));
        when(mockGetRandomNumberTrivia(any)).thenAnswer(
          (_) async => const Right(tNumberTrivia),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.loading(),
          const BaseState<NumberTrivia>.success(data: tNumberTrivia),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getRandomNumberTrivia();
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.loading], [BaseState<NumberTrivia>.error] when getting data fails',
      () async {
        // arrange
        provideDummy<Either<Failure, NumberTrivia>>(
          const Left(Failure.server()),
        );
        when(mockGetRandomNumberTrivia(any)).thenAnswer(
          (_) async => const Left(Failure.server()),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.loading(),
          const BaseState<NumberTrivia>.error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getRandomNumberTrivia();
      },
    );

    test(
      'should emit [BaseState<NumberTrivia>.loading], [BaseState<NumberTrivia>.error] with a proper message for the error when getting data fails',
      () async {
        // arrange
        provideDummy<Either<Failure, NumberTrivia>>(
          const Left(Failure.cache()),
        );
        when(mockGetRandomNumberTrivia(any)).thenAnswer(
          (_) async => const Left(Failure.cache()),
        );
        // assert later
        final expected = [
          const BaseState<NumberTrivia>.loading(),
          const BaseState<NumberTrivia>.error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(cubit.stream, emitsInOrder(expected));
        // act
        cubit.getRandomNumberTrivia();
      },
    );
  });
}
