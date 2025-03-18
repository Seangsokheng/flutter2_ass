import 'package:flutter_ass/week6/homework/EX-1-START-CODE/models/course.dart';
import 'package:flutter_ass/week6/homework/EX-1-START-CODE/repository/courses_repository.dart';

class MockRepository extends CoursesRepository {
  final List<Course> _allCourses = [Course(name: 'HTML' , id: 1), Course(name: 'JAVA' , id: 2),Course(name: 'CSS' , id: 3)];

  @override
  List<Course> getCourses() {
    return _allCourses;
  }

  void addScore(Course course, CourseScore score) {
    final findCourse = _allCourses.firstWhere(
      (c) => c.name == course.name,
      orElse: () => course,
    );
    findCourse.addScore(score);
  }
}
