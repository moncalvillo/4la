import 'package:app/shared/data/data.dart';
import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const String name = "home_page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("4la"),
      ),
      body: const _HomeView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push("/nickname");
        },
        label: const Text("Cambiar apodo"),
        icon: const Icon(Icons.edit),
        backgroundColor: colors.primary,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                  label: "Crear sala",
                  onPressed: () {
                    context.push('/new-room');
                  }),
              const SizedBox(height: 20),
              CustomButton(
                  label: "Unirme a sala",
                  onPressed: () {
                    context.push('/join-room');
                  }),
            ]),
      ),
    );
  }
}
