import 'package:app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WaitingRoomScreen extends ConsumerWidget {
  static const String name = 'waiting_room_screen';
  final String roomId;

  const WaitingRoomScreen(this.roomId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Esperando a jugadores'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final nickname = ref.read(nicknameProvider);
            ref.read(playersListProvider.notifier).removePlayer(nickname ?? "");
            context.pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (players.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(players[index]),
                    );
                  },
                ),
              ),
            if (players.length != 4) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Text('Comparte el código de la sala con tus amigos: '),
            const SizedBox(height: 20),
            Text(
              roomId,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
