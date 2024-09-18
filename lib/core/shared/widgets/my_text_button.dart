import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isUpperCase;
  final TextStyle? style;

  const MyTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isUpperCase = true,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: style,
      ),
    );
  }
}
