import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizy/models/question.dart';

ThemeData? theme;

//? Provider
final selectedAnswerProvider = StateProvider.autoDispose((ref) => "");
final scoreProvider = StateProvider((red) => 0);
final questionProvider = StateNotifierProvider<QuestionListNotifier, List<Question>>((ref) => QuestionListNotifier());
final currentQuestionProvider = StateProvider((ref) => 1);
// each right answer score += 20, wrong answer score -= 10
