import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  final post = [
    Post(id: 1, title: "title", description: "description"),
    Post(id: 25, title: 'Who is the best', description: 'teacher ronan'),
    Post(id: 5, title: 'Who do you love?', description: 'teacher ronan'),
  ];
  @override
  Future<List<Post>> getPost(int postId) {
    return Future.delayed(Duration(seconds: 5), () {
      // if (postId != 25) {
      //   throw Exception("No post found");
      // }
      return post;
    });
  }
}
