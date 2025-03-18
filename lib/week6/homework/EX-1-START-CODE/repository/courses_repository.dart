import 'package:flutter_ass/week6/homework/EX-1-START-CODE/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();

  void addScore(Course course, CourseScore score);
}
