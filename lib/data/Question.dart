import 'dart:convert';

class Question {
  final String question;
  final List<String> answers;
  final int correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  static Question fromJson(String data) {
    print(data);
    dynamic jsonData = json.decode(data);
    return Question(
      question: jsonData['question'],
      answers: [
        jsonData['answer1'],
        jsonData['answer2'],
        jsonData['answer3'],
        jsonData['answer4'],
      ],
      correctAnswer: jsonData['correct_answer'] - 1,
    );
  }
}
