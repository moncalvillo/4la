class Player {
  String nickname = '';

  Player({required this.nickname});

  Player.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    return data;
  }

  @override
  String toString() {
    return 'Player{nickname: $nickname}';
  }
}
