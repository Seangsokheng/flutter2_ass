import 'dart:convert';
import 'package:flutter_ass/week6/homework/EX-2-START-CODE/dto/post_dto.dart';
import 'package:flutter_ass/week6/homework/EX-2-START-CODE/repository/post_repository.dart';
import 'package:http/http.dart' as http;
import '../model/post.dart';

class HttpPostsRepository extends PostRepository {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<List<Post>> getPost(int userId) async {
    final response = await http.get(Uri.parse(url));
  
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => PostDTO.fromJson(json).toModel()).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
