// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizy/data.dart';

class AnswerField extends ConsumerWidget {
  final String text;
  const AnswerField({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswer = ref.watch(selectedAnswerProvider);

    return GestureDetector(
      onTap: () {
        ref.read(selectedAnswerProvider.notifier).state = this.text;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selectedAnswer == this.text
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
                child: selectedAnswer == this.text
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
                  this.text,
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
