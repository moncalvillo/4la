import 'package:app/shared/providers/session_provider.dart';
import 'package:app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NicknameForm extends StatefulWidget {
  const NicknameForm({Key? key}) : super(key: key);

  @override
  State<NicknameForm> createState() => _NicknameFormState();
}

class _NicknameFormState extends State<NicknameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String nickname = "";

  @override
  void initState() {
    super.initState();
    final session = context.read<SessionProvider>();
    if (session.isNamed) {
      nickname = session.nickname!;
      _controller.text = nickname;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final session = context.read<SessionProvider>();
    onSubmit() {
      if (_formKey.currentState!.validate()) {
        if (nickname != session.nickname) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: colors.brightness == Brightness.dark
                  ? colors.onSurface
                  : colors.primary,
              content: Text('Nickname actualizado: ${nickname.toUpperCase()}'),
            ),
          );
          session.setNickname(nickname);
        }
        context.push('/');
      }
    }

    onChange(String value) {
      nickname = value.toUpperCase();
      _controller.value = TextEditingValue(
        text: nickname,
        selection: TextSelection.collapsed(
          offset: nickname.length,
        ),
      );
    }

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
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa un nickname';
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nickname",
                  hintText: "Escribe tu nickname",
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(20)),
              onChanged: onChange,
              onFieldSubmitted: (value) => onSubmit(),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: onSubmit,
              label: "Continuar",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
