import 'package:flutter/material.dart';
import 'package:flutter_ass/week8/homework/model/player_model.dart';
import 'package:flutter_ass/week8/homework/ui/provider/player_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  void _onAddPressed(BuildContext context) {
    final Playerprovider pancakeProvider = context.read<Playerprovider>();
    pancakeProvider.addPlayers("sokheng", 100);
  }

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<Playerprovider>(context);

    Widget content = Text('');
    if (playerProvider.isLoading) {
      content = CircularProgressIndicator();
    } else if (playerProvider.hasData) {
      List<Player> player = playerProvider.playersState!.data!;

      if (player.isEmpty) {
        content = Text("No data yet");
      } else {
        content = ListView.builder(
          itemCount: player.length,
          itemBuilder:
              (context, index) => ListTile(
                title: Text(player[index].name),
                subtitle: Text("${player[index].score}"),
                trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => {}),
              ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [IconButton(onPressed: () => _onAddPressed(context), icon: const Icon(Icons.add))],
      ),
      body: Center(child: content),
    );
  }
}