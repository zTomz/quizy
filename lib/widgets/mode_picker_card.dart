// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:quizy/data.dart';
import 'package:quizy/pages/quiz_page.dart';

class ModePickerCard extends StatelessWidget {
  final String title;
  final List<Color> colors;
  const ModePickerCard({
    Key? key,
    required this.title,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuizPage(
              difficulty: this.title,
            ),
          ),
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: this.colors,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            this.title,
            style: theme!.textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
