import 'package:flutter/material.dart';
import 'package:flutter_ass/week6/homework/EX-1-START-CODE/provider/courses_provider.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.courseID});

  final int courseID;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  //List<CourseScore> get scores => widget.course.scores;
  int get courseId => widget.courseID;

  void _addScore() async {
    CourseScore? newSCore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newSCore != null) { 
        Provider.of<CoursesProvider>(context, listen: false).addScore(courseId, newSCore); 
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No Scores added yet.'));

    final coursesProvider = Provider.of<CoursesProvider>(context);
    final Course course = coursesProvider.getCourseFor(courseId);

    if (course.scores.isNotEmpty) {
      content = ListView.builder(
        itemCount: course.scores.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(course.scores[index].studentName),
              trailing: Text(
                course.scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(course.scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: _addScore, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
