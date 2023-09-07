import 'package:flutter_riverpod/flutter_riverpod.dart';

final playersListProvider =
    StateNotifierProvider<PlayersListNotiifer, List<String>>(
        (ref) => PlayersListNotiifer());

class PlayersListNotiifer extends StateNotifier<List<String>> {
  PlayersListNotiifer() : super([]);

  void addPlayer(String playerName) {
    state = [...state, playerName];
  }

  void removePlayer(String playerName) {
    state = state.where((player) => player != playerName).toList();
  }

  // Puedes agregar más métodos según lo necesites.
}
