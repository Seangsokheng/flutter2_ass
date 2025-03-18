import 'package:flutter_ass/week6/homework/EX-2-START-CODE/model/post.dart';

class PostDTO {
  final int id;
  final String title;
  final String body;

  PostDTO({required this.id, required this.title, required this.body});

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int);
    return PostDTO(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Post toModel() {
    return Post(id: id, title: title, description: body);
  }
}
