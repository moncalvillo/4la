import 'package:app/shared/providers/session_provider.dart';
import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NicknamePage extends StatelessWidget {
  static const String name = "nickname_page";
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = context.read<SessionProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nickname'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            session.nickname != null
                ? Text(
                    '¿No eres el famoso ${session.nickname?.toUpperCase()}?',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
            const SizedBox(height: 40),
            const NicknameForm(),
          ]),
        ),
      ),
    );
  }
}
