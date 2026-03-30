import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputLine extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isObscure;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  const InputLine({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isObscure = false,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isObscure, // Şifre alanı
          keyboardType: inputType, // Veri türü
          inputFormatters: inputFormatters,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(255, 255, 255, 0.2),
            hintText: subtitle,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(icon, color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
