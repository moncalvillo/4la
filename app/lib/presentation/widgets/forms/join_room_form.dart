import 'package:app/presentation/decorations/decorations.dart';
import 'package:app/shared/providers/session_provider.dart';
import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinRoomForm extends StatefulWidget {
  const JoinRoomForm({Key? key}) : super(key: key);

  @override
  State<JoinRoomForm> createState() => _JoinRoomFormState();
}

class _JoinRoomFormState extends State<JoinRoomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final session = context.read<SessionProvider>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: colors.surface,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa un codigo';
                }
                if (value.length != 8) {
                  return 'El codigo debe tener 8 caracteres';
                }
                return null;
              },
              maxLength: 8,
              decoration: CustomInputDecoration.noBordersInput(
                labelText: "Codigo de la sala",
                hintText: "Ingrese el codigo de la sala",
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      backgroundColor: colors.brightness == Brightness.dark
                          ? colors.onSurface
                          : colors.primary,
                      content: const Text(
                        'Uniendote a sala...',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              label: "Jugar",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
