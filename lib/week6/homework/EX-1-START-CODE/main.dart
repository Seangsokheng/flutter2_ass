import 'package:flutter/material.dart';
import 'package:flutter_ass/week6/homework/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:flutter_ass/week6/homework/EX-1-START-CODE/repository/courses_mock_repository.dart';
import 'package:provider/provider.dart';
import 'screens/course_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoursesProvider(MockRepository()),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CourseListScreen(),
    );
  }
}
