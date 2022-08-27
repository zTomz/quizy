// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizy/data.dart';
import 'package:quizy/models/question.dart';
import 'package:http/http.dart' as http;
import 'package:quizy/widgets/answer_field.dart';

class QuizPage extends StatefulWidget {
  final String difficulty;
  const QuizPage({Key? key, required this.difficulty}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  int currentQuestion = 1;
  String selectedAnswer = "";
  int score = 0;
  // each right answer score += 20, wrong answer score -= 10

  @override
  void initState() {
    loadData();

    super.initState();
  }

  Future<void> loadData() async {
    http.Response response = await http.get(
      Uri.parse(
        "https://the-trivia-api.com/api/questions?categories=arts_and_literature,film_and_tv,food_and_drink,general_knowledge,geography,history,music,science,society_and_culture,sport_and_leisure&limit=15&difficulty=${this.widget.difficulty.toLowerCase()}",
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

        questions.add(
          Question(
            category: currentObject["category"],
            question: currentObject["question"],
            correctAnswer: currentObject["correctAnswer"],
            answers: answers,
          ),
        );
      }

      setState(() {});
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.difficulty,
          style: theme!.textTheme.bodyText1,
        ),
      ),
      body: questions.isNotEmpty
          ? SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswer =
                              questions[currentQuestion - 1].answers[0];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInExpo,
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedAnswer ==
                                  questions[currentQuestion - 1].answers[0]
                              ? Colors.red
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: theme!.accentColor),
                                  shape: BoxShape.circle,
                                ),
                                child: selectedAnswer ==
                                        questions[currentQuestion - 1].answers[0]
                                    ? Center(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: theme!.accentColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  questions[currentQuestion - 1].answers[0],
                                  style: theme!.textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswer =
                              questions[currentQuestion - 1].answers[1];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInExpo,
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedAnswer ==
                                  questions[currentQuestion - 1].answers[1]
                              ? Colors.red
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: theme!.accentColor),
                                  shape: BoxShape.circle,
                                ),
                                child: selectedAnswer ==
                                        questions[currentQuestion - 1].answers[1]
                                    ? Center(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: theme!.accentColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  questions[currentQuestion - 1].answers[1],
                                  style: theme!.textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswer =
                              questions[currentQuestion - 1].answers[2];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInExpo,
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedAnswer ==
                                  questions[currentQuestion - 1].answers[2]
                              ? Colors.red
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: theme!.accentColor),
                                  shape: BoxShape.circle,
                                ),
                                child: selectedAnswer ==
                                        questions[currentQuestion - 1].answers[2]
                                    ? Center(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: theme!.accentColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  questions[currentQuestion - 1].answers[2],
                                  style: theme!.textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswer =
                              questions[currentQuestion - 1].answers[3];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInExpo,
                        height: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedAnswer ==
                                  questions[currentQuestion - 1].answers[3]
                              ? Colors.red
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: theme!.accentColor),
                                  shape: BoxShape.circle,
                                ),
                                child: selectedAnswer ==
                                        questions[currentQuestion - 1].answers[3]
                                    ? Center(
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: theme!.accentColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Text(
                                  questions[currentQuestion - 1].answers[3],
                                  style: theme!.textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedAnswer ==
                            questions[currentQuestion - 1].correctAnswer) {
                          setState(() {
                            score += 20;
                            currentQuestion += 1;
                            selectedAnswer = "";
                          });
                        } else {
                          setState(() {
                            score -= 10;
                            currentQuestion += 1;
                            selectedAnswer = "";
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
