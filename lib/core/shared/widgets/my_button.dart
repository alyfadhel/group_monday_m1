import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isUpperCase;
  final TextStyle? style;
  final double width;
  final Color background;
  final double? radius;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isUpperCase = true,
    this.style,
    this.width = double.infinity,
    this.background = Colors.blue,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius!,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: style,
        ),
      ),
    );
  }
}
