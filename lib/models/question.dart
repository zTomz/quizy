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
