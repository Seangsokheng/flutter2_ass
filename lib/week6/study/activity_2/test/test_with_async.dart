// ignore_for_file: avoid_print

import 'package:flutter_ass/week6/study/activity_2/repository/mock_post_repository.dart';

void main() {
  // 1- Create the repo
  MockPostRepository mockPost = MockPostRepository();
  // TODO

  // 2- Request the post  - Success
  Future<void> fectchData() async {
    try {
      final response = await mockPost.getPost(25);
      print(response);
    } catch (e) {
      throw Exception("Fectch data error");
    }
  }
  // TODO

  // 3- Request the post - Failed
  Future<void> fectchDataError() async {
    try {
      final response = await mockPost.getPost(5);
      print(response);
    } catch (e) {
      throw Exception("Fectch data error");
    }
  }

  // TODO
  fectchData();
  fectchDataError();
}
