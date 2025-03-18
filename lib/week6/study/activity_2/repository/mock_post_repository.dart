// TODO
import 'package:flutter_ass/week6/study/activity_2/model/post.dart';
import 'package:flutter_ass/week6/study/activity_2/repository/post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int postId) {
    return Future.delayed(Duration(seconds: 3), () {
      if (postId == 25) {
        return Post(
          id: 25,
          title: "who is the best",
          description: "Teacher Ronan",
        );
      } else {
        throw Exception("No post found");
      }
    });
  }
}
