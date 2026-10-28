import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData icon;
  final bool obscure;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    this.hint,
    this.obscure = false,
    this.readOnly = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}