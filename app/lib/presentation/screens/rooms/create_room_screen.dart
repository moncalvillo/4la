import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateRoomScreen extends StatelessWidget {
  static const String name = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear sala'),
        centerTitle: true,
      ),
      body: const _CreateRoomView(),
    );
  }
}

class _CreateRoomView extends StatelessWidget {
  const _CreateRoomView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              CreateRoomForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
