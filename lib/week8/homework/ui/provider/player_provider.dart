// PROVIDER
import 'package:flutter/material.dart';
import 'package:flutter_ass/week8/homework/data/repository/players_repository.dart';
import 'package:flutter_ass/week8/homework/model/player_model.dart';
import 'package:flutter_ass/week8/homework/ui/provider/async_value.dart';

class Playerprovider extends ChangeNotifier {
  final PlayerRepository _repository;
  AsyncValue<List<Player>>? playersState;

  Playerprovider(this._repository) {
    fetchUsers();
  }

  bool get isLoading => playersState != null && playersState!.state == AsyncValueState.loading;
  bool get hasData => playersState != null && playersState!.state == AsyncValueState.success;

  void fetchUsers() async {
    try {
      // 1- loading state
      playersState = AsyncValue.loading();
      notifyListeners();

      // 2 - Fetch users
      playersState = AsyncValue.success(await _repository.getPlayers());

      print("SUCCESS: list size ${playersState!.data!.length.toString()}");

      // 3 - Handle errors
    } catch (error) {
      print("ERROR: $error");
      playersState = AsyncValue.error(error);
    }

    notifyListeners();
  }

  void addPlayers(String name, double score) async {
    // 1- Call repo to add
    _repository.addPlayers(name: name, score: score);

    // 2- Call repo to fetch
    fetchUsers();
  }
}
