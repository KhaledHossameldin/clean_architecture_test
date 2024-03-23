import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../bloc/number_trivia_cubit.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({super.key});

  @override
  State<TriviaControls> createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final _numberTriviaCubit = sl<NumberTriviaCubit>();

  final _controller = TextEditingController();

  void _getConcrete() {
    _numberTriviaCubit.getConcreteNumberTrivia(_controller.text);
  }

  void _getRandom() {
    _numberTriviaCubit.getRandomNumberTrivia();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _controller,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 8),
      Row(children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _getConcrete,
            child: const Text('Search'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: _getRandom,
            child: const Text('Random'),
          ),
        ),
      ]),
    ]);
  }
}
