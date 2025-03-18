import 'package:flutter/widgets.dart';
import 'package:flutter_ass/week6/homework/EX-1-START-CODE/models/course.dart';
import 'package:flutter_ass/week6/homework/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesRepository repository;
  List<Course> courses = [];

  CoursesProvider(this.repository) {
    courses = repository.getCourses();
  }
  Course getCourseFor(int courseId) {
    return courses.firstWhere(
      (course) => course.id == courseId,
      orElse: () => throw Exception("Course no found"),
    );
  }

  void addScore(int courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    repository.addScore(course, score);
    notifyListeners();
  }
}
