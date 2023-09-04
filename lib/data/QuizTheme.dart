import 'package:flutter/material.dart';

class QuizTheme extends ChangeNotifier {
  String themeName;
  Color primaryColor;
  Icon icon;

  QuizTheme(
      {required this.themeName,
      required this.primaryColor,
      required this.icon});

  void setThemeName(String themeName) {
    this.themeName = themeName;
    notifyListeners();
  }

  void setPrimaryColor(Color primaryColor) {
    this.primaryColor = primaryColor;
    notifyListeners();
  }

  void setIcon(Icon icon) {
    this.icon = icon;
    notifyListeners();
  }
}
