import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yasma/data/QuizTheme.dart";
import "package:yasma/quiz.dart";

void main() {
  runApp(
    ChangeNotifierProvider<QuizTheme>(
      create: (context) => QuizTheme(
        themeName: 'Random',
        primaryColor: Colors.blue,
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Yasma',
      home: Quiz(),
    );
  }
}
