import 'package:app/presentation/widgets/forms/join_room_form.dart';
import 'package:flutter/material.dart';

class JoinRoomScreen extends StatelessWidget {
  static const String name = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unirse a sala'),
        centerTitle: true,
      ),
      body: const _JoinRoomView(),
    );
  }
}

class _JoinRoomView extends StatelessWidget {
  const _JoinRoomView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              JoinRoomForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
