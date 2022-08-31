// ignore_for_file: unnecessary_this

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizy/data.dart';
import 'package:quizy/widgets/answer_field.dart';

class QuizPage extends ConsumerWidget {
  final String difficulty;
  const QuizPage(this.difficulty, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionProvider);

    if (questions.isEmpty) {
      ref.read(questionProvider.notifier).loadData(this.difficulty);
    }

    final currentQuestion = ref.watch(currentQuestionProvider);
    final score = ref.watch(scoreProvider);

    return Scaffold(
      body: questions.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Question $currentQuestion/15",
                          style: const TextStyle(
                            color: Color(0xFFF6AE2D),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Score: $score",
                          style: const TextStyle(
                            color: Color(0xFF5DD39E),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      questions[currentQuestion - 1].question,
                      style: theme!.textTheme.headline1!.copyWith(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    AnswerField(
                      text: questions[currentQuestion - 1].answers[0],
                    ),
                    AnswerField(
                      text: questions[currentQuestion - 1].answers[1],
                    ),
                    AnswerField(
                      text: questions[currentQuestion - 1].answers[2],
                    ),
                    AnswerField(
                      text: questions[currentQuestion - 1].answers[3],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (ref.read(selectedAnswerProvider.notifier).state ==
                            ref
                                .read(questionProvider.notifier)
                                .state[currentQuestion - 1]
                                .correctAnswer) {
                          Timer(const Duration(seconds: 1), () {
                            ref.read(scoreProvider.notifier).state += 20;
                            ref.read(currentQuestionProvider.notifier).state +=
                                1;
                          });
                        } else {
                          Timer(const Duration(seconds: 1), () {
                            ref.read(scoreProvider.notifier).state -= 10;
                            ref.read(currentQuestionProvider.notifier).state +=
                                1;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 10,
                        ),
                        child: Text(
                          "Check",
                          style: theme!.textTheme.bodyText1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
