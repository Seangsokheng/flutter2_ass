// REPOSITORY
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ass/week8/homework/data/repository/firebase/firebase_player_repository.dart';
import 'package:flutter_ass/week8/homework/data/repository/players_repository.dart';
import 'package:flutter_ass/week8/homework/ui/provider/player_provider.dart';
import 'package:flutter_ass/week8/homework/ui/screen/home_screen.dart';
import 'package:provider/provider.dart';



// 5 - MAIN
void main() async {
  // 1 - Create repository
  final PlayerRepository playerRepository = FirebasePlayerRepository();

  // 2-  Run app
  runApp(
    ChangeNotifierProvider(
      create: (context) => Playerprovider(playerRepository),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: const App()),
    ),
  );
}
