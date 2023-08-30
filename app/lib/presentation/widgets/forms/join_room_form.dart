import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class JoinRoomForm extends StatefulWidget {
  const JoinRoomForm();

  @override
  State<JoinRoomForm> createState() => _JoinRoomFormState();
}

class _JoinRoomFormState extends State<JoinRoomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String roomCode = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              maxLength: 7,
              formatters: [UpperCaseTextFormatter()],
              style: const TextStyle(
                letterSpacing: 10.0,
              ),
              textAlign: TextAlign.center,
              label: 'Código de la sala',
              onChanged: (value) => roomCode = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length != 7) return 'Deben ser 7 caracteres';
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;

                print('$roomCode');
              },
              icon: const Icon(Icons.arrow_circle_right_outlined),
              label: const Text('Unirse'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ));
  }
}
