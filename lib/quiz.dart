import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yasma/data/Phase.dart';
import 'package:yasma/data/Question.dart';
import "package:http/http.dart" as http;
import 'package:yasma/data/QuizTheme.dart';
import 'package:yasma/theme.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Question? question;
  int phase = Phase.loading;
  bool loading = true;

  Future<void> fetchData() async {
    setState(() {
      loading = true;
    });
    print(Provider.of<QuizTheme>(context, listen: false).themeName);
    final response = await http.get(Uri.parse(
        'https://pageup.lt/api/ai/generate_quiz_themed?theme=${Provider.of<QuizTheme>(context, listen: false).themeName}'));

    if (response.statusCode == 200) {
      setState(() {
        question = Question.fromJson(response.body);
        phase = Phase.showingQuestion;
        loading = false;
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void answerQuestion(int answer) {
    print(answer);
    print(question!.correctAnswer);
    if (phase != Phase.showingQuestion) {
      return;
    }
    setState(() {
      phase = Phase.showingAnswer;
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final quizTheme = Provider.of<QuizTheme>(context, listen: true);

    // to refresh for new theme
    quizTheme.addListener(() {
      if (loading) {
        return;
      }
      fetchData();
    });

    // 4 buttons with answers and one text field with question
    return Scaffold(
      appBar: AppBar(
        title: Text(quizTheme.themeName),
        backgroundColor: quizTheme.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeSelectionScreen()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // loading indicator
            if (loading)
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: const CircularProgressIndicator(),
              ),
            Text(
              (phase == Phase.loading)
                  ? 'Loading...'
                  : question?.question ?? "Question could not be loaded",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: (phase == Phase.loading)
                  ? null
                  : Column(
                      children: [
                        for (int i = 0; i < question!.answers.length; i++)
                          ElevatedButton(
                            onPressed: () {
                              answerQuestion(i);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (phase == Phase.showingAnswer)
                                  ? (i == question!.correctAnswer)
                                      ? Colors.green
                                      : Colors.red
                                  : null,
                            ),
                            child: Text(question!.answers[i]),
                          ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
