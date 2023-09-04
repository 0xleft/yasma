import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasma/data/QuizTheme.dart';

class ThemeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizTheme = Provider.of<QuizTheme>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quiz Theme'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Theme 1'),
            onTap: () {
              quizTheme.setThemeName('Theme 1');
              quizTheme.setPrimaryColor(Colors.red);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('Theme 2'),
            onTap: () {
              quizTheme.setThemeName('Theme 2');
              quizTheme.setPrimaryColor(Colors.green);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
