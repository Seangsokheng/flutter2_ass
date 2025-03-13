import 'package:flutter/material.dart';

class ColorCounters with ChangeNotifier {
  int redTaps = 0;
  int blueTaps = 0;

  void incrementRed() {
    redTaps++;
    notifyListeners(); 
  }

  void incrementBlue() {
    blueTaps++;
    notifyListeners(); 
  }
}

enum CardType { red, blue }

