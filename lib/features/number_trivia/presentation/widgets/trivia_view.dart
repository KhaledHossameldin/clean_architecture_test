import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_state.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/number_trivia.dart';
import '../bloc/number_trivia_cubit.dart';

class TriviaView extends StatelessWidget {
  TriviaView({super.key});

  final _numberTriviaCubit = sl<NumberTriviaCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberTriviaCubit, BaseState<NumberTrivia>>(
      bloc: _numberTriviaCubit,
      builder: (context, state) {
        return state.when<Widget>(
          initial: () => const Center(
            child: Text('Number Trivia!', style: TextStyle(fontSize: 24)),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (trivia) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                trivia.number.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(trivia.text, textAlign: TextAlign.center),
            ],
          ),
          error: (message) => Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
