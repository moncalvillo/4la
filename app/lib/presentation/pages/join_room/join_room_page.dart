import 'package:app/shared/providers/session_provider.dart';
// import 'package:app/widgets/widgets.dart';
import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinRoomPage extends StatelessWidget {
  static const String name = "join_room_page";
  const JoinRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.read<SessionProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unete a una sala'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vas a unirte a la sala como: ${session.nickname?.toUpperCase()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const JoinRoomForm(),
            ],
          ),
        ),
      ),
    );
  }
}
