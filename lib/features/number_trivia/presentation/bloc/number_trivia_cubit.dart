// ignore_for_file: constant_identifier_names

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_state.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../../core/utils/input_converter.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/use_cases/get_concrete_number_trivia.dart';
import '../../domain/use_cases/get_random_number_trivia.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaCubit extends Cubit<BaseState<NumberTrivia>> {
  NumberTriviaCubit({
    required this.getConcreteNumberTriviaUseCase,
    required this.getRandomNumberTriviaUseCase,
    required this.inputConverter,
  }) : super(const BaseState.initial());

  final GetConcreteNumberTriviaUseCase getConcreteNumberTriviaUseCase;
  final GetRandomNumberTriviaUseCase getRandomNumberTriviaUseCase;
  final InputConverter inputConverter;

  Future<void> getConcreteNumberTrivia(String numberString) async {
    final inputEither = inputConverter.stringToUnsignedInteger(numberString);
    inputEither.fold(
      (failure) => emit(
        const BaseState.error(message: INVALID_INPUT_FAILURE_MESSAGE),
      ),
      (number) async {
        emit(const BaseState.loading());
        final failureOrTrivia = await getConcreteNumberTriviaUseCase(
          Params(number: number),
        );
        _eitherLoadedOrErrorState(failureOrTrivia);
      },
    );
  }

  Future<void> getRandomNumberTrivia() async {
    emit(const BaseState.loading());
    final failureOrTrivia = await getRandomNumberTriviaUseCase(
      const NoParams(),
    );
    _eitherLoadedOrErrorState(failureOrTrivia);
  }

  void _eitherLoadedOrErrorState(
    Either<Failure, NumberTrivia> failureOrTrivia,
  ) {
    failureOrTrivia.fold(
      (failure) => emit(
        BaseState.error(
          message: failure.whenOrNull<String>(
            server: () => SERVER_FAILURE_MESSAGE,
            cache: () => CACHE_FAILURE_MESSAGE,
          )!,
        ),
      ),
      (trivia) => emit(BaseState.success(data: trivia)),
    );
  }
}
