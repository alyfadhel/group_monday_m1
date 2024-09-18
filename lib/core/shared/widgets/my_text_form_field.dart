import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final bool isUpperCase;
  final double? radius;
  final IconData prefix;
  final IconData? suffix;
  final Function()? onPressed;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool isPassword;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.label,
    required this.prefix,
    required this.validator,
    this.isUpperCase = true,
    this.isPassword = false,
    this.radius,
    this.suffix,
    this.onPressed,
    this.onFieldSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: isUpperCase ? label.toUpperCase() : label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius!,
          ),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null ? IconButton(
          onPressed: onPressed,
          icon: Icon(suffix),
        ) : null,
      ),
    );
  }
}
