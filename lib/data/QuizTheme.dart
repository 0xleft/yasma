import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizTheme extends ChangeNotifier {
  String themeName;
  Color primaryColor;

  QuizTheme({required this.themeName, required this.primaryColor});

  void setThemeName(String themeName) {
    this.themeName = themeName;
    notifyListeners();
  }

  void setPrimaryColor(Color primaryColor) {
    this.primaryColor = primaryColor;
    notifyListeners();
  }
}
