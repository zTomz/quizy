// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:quizy/data.dart';

class AnswerField extends StatefulWidget {
  String selectedAnswer;
  final String text;

  AnswerField({Key? key, required this.selectedAnswer, required this.text})
      : super(key: key);

  @override
  State<AnswerField> createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<AnswerField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.widget.selectedAnswer = this.widget.text;
        });
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: this.widget.selectedAnswer == this.widget.text
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
                  border: Border.all(width: 2, color: theme!.accentColor),
                  shape: BoxShape.circle,
                ),
                child: this.widget.selectedAnswer == this.widget.text
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
                  this.widget.text,
                  style: theme!.textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
