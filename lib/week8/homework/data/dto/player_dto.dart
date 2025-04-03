import 'package:flutter_ass/week8/study/main.dart';

// MODEL & DTO
class PlayerDto {
  static Player fromJson(String id, Map<String, dynamic> json) {
    return Player(
      id: id,
      name: json['name'],
      score: (json['score'] as num).toInt(), // Convert int to double safely
    );
  }

  static Map<String, dynamic> toJson(Player player) {
    return {'name': player.name , 'score': player.score};
  }
}
