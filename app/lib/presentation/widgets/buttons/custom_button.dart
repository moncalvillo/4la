import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Icon? icon;
  const CustomButton(
      {super.key, required this.label, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: icon == null
          ? ElevatedButton(
              onPressed: onPressed,
              child: Text(label),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: Text(label),
            ),
    );
  }
}
