import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  const String baseUrl = "https://sokheng-64eba-default-rtdb.firebaseio.com";

  const String player = "player";
  const String allPlayers = '$baseUrl/$player.json';

  Uri uri = Uri.parse(allPlayers);
  final http.Response response = await http.get(uri);

  if (response.statusCode == HttpStatus.ok) {
    final data = json.decode(response.body) as Map<String, dynamic>?;
    
    List<Player> result = [];
    if (data != null) {
      result = data.entries.map((entry) => PlayerDto.fromJson(entry.key, entry.value)).toList();
    }

   print(result[0].name);
  }
}

class PlayerDto {
  static Player fromJson(String id, Map<String, dynamic> json) {
    return Player(id: id, name: json['name'], score: json['score']);
  }
}

class Player {
  final String id;
  final String name;
  final int score;

  Player({required this.id, required this.name, required this.score});
}