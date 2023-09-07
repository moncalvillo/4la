import 'package:app/shared/types/player.dart';

class Room {
  List<Player> playersList;
  String roomId;

  Room({this.playersList = const [], required this.roomId});
}
