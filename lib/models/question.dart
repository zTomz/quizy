import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Question {
  final String category; // 0
  final String question; // 4
  final String correctAnswer; // 2
  final List<String> answers; // 3

  Question({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });
}

class QuestionListNotifier extends StateNotifier<List<Question>> {
  QuestionListNotifier() : super([]);

  void loadData(String difficulty) async {
    http.Response response = await http.get(
      Uri.parse(
        "https://the-trivia-api.com/api/questions?categories=arts_and_literature,film_and_tv,food_and_drink,general_knowledge,geography,history,music,science,society_and_culture,sport_and_leisure&limit=15&difficulty=${difficulty.toLowerCase()}",
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      for (int i = 0; i < 15; i++) {
        final currentObject = json[i];
        List<dynamic> _incorrectAnswers = currentObject["incorrectAnswers"];
        List<String> answers = [];

        for (var incorrectAnswer in _incorrectAnswers) {
          answers.add(incorrectAnswer.toString());
        }

        answers.add(currentObject["correctAnswer"]);
        answers.shuffle();

        state.add(
          Question(
            category: currentObject["category"],
            question: currentObject["question"],
            correctAnswer: currentObject["correctAnswer"],
            answers: answers,
          ),
        );
      }
    } else {
      print(response.statusCode);
    }
  }
}
