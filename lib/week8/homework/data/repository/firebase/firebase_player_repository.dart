import 'dart:convert';
import 'dart:io';

import 'package:flutter_ass/week8/homework/data/dto/player_dto.dart';
import 'package:flutter_ass/week8/homework/data/repository/players_repository.dart';
import 'package:flutter_ass/week8/homework/model/player_model.dart';

import 'package:http/http.dart' as http;

class FirebasePlayerRepository extends PlayerRepository {
  static const String baseUrl =
      "https://sokheng-64eba-default-rtdb.firebaseio.com";

  static const String player = "player";
  static const String allPlayersUrl = '$baseUrl/$player.json';
  
  @override
  Future<Player> addPlayers({
    required String name,
    required double score,
  }) async {
    Uri uri = Uri.parse(allPlayersUrl);

    final newPlayer = {'name': name, "score": score};
    final http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newPlayer),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Failed to add player");
    }
    final newId = json.decode(response.body)['name'];

    return Player(id: newId, name: name, score: score);
  }


  @override
  Future<List<Player>> getPlayers() async {
    Uri uri = Uri.parse(allPlayersUrl);
    final http.Response response = await http.get(uri);

    // Handle errors
    if (response.statusCode != HttpStatus.ok && response.statusCode != HttpStatus.created) {
      throw Exception('Failed to load');
    }

    // Return all users
    final data = json.decode(response.body) as Map<String, dynamic>?;

    if (data == null) return [];
    return data.entries.map((entry) => PlayerDto.fromJson(entry.key, entry.value)).toList();
  }
}
