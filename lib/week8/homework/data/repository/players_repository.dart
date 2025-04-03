
import 'package:flutter_ass/week8/homework/model/player_model.dart';

abstract class PlayerRepository {

  Future<Player> addPlayers({required String name, required double score});
  
  Future<List<Player>> getPlayers();
}
