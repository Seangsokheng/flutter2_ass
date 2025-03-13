import 'package:flutter/material.dart';
import 'package:flutter_ass/week5/homework/exercise-2/model/color_counters.dart';
import 'package:flutter_ass/week5/homework/exercise-2/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("My app rebuild");
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
