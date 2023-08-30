import 'package:app/presentation/providers/nickname_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NicknameScreen extends StatefulWidget {
  static const String name = 'nickname_screen';

  const NicknameScreen({Key? key}) : super(key: key);

  @override
  _NicknameScreenState createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nickname'),
        centerTitle: true,
      ),
      body: _NicknameView(nicknameController: _nicknameController),
    );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }
}

class _NicknameView extends ConsumerWidget {
  final TextEditingController nicknameController;

  const _NicknameView({required this.nicknameController});

  @override
  Widget build(BuildContext context, ref) {
    final nicknameNotifier = ref.read(nicknameProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: const Alignment(-0.0, 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (nicknameNotifier.state != null)
              Text(
                '¿No eres el famoso ${nicknameNotifier.state}?',
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            const SizedBox(height: 16),
            const Text(
              'Ingresa tu nickname',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nicknameController,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  final nickname = nicknameController.text;
                  if (nickname.isNotEmpty) {
                    // Guarda el nickname y/o navega a otra pantalla
                    nicknameNotifier.state = nickname;
                    context.go('/');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Por favor, ingresa un nickname")),
                    );
                  }
                },
                child: const Text("Continuar")),
          ],
        ),
      ),
    );
  }
}
