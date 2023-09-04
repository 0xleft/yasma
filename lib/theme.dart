import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasma/data/QuizTheme.dart';

class ThemeSelectionScreen extends StatelessWidget {
  ThemeSelectionScreen({super.key});

  final List<QuizTheme> themes = [
    QuizTheme(
        themeName: "Physics",
        primaryColor: const Color.fromARGB(255, 45, 155, 246),
        icon: const Icon(Icons.science)),
    QuizTheme(
        themeName: "Math",
        primaryColor: Colors.cyan,
        icon: const Icon(Icons.calculate)),
    QuizTheme(
        themeName: "History",
        primaryColor: Colors.deepPurple,
        icon: const Icon(Icons.history)),
    QuizTheme(
        themeName: "Memes",
        primaryColor: Colors.orange,
        icon: const Icon(Icons.mood)),
    QuizTheme(
        themeName: "Coding",
        primaryColor: Colors.blue,
        icon: const Icon(Icons.help)),
  ];

  @override
  Widget build(BuildContext context) {
    final quizTheme = Provider.of<QuizTheme>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Quiz Theme'),
      ),
      body: ListView(
        children: themes
            .map(
              (theme) => ListTile(
                title: Text(theme.themeName),
                leading: theme.icon,
                onTap: () {
                  quizTheme.setThemeName(theme.themeName);
                  quizTheme.setPrimaryColor(theme.primaryColor);
                  Navigator.pop(context);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
