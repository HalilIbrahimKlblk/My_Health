import 'package:flutter/material.dart';

class InputLine extends StatelessWidget {
  final String title;
  final String subtitle;
  //final IconData? icon;

  const InputLine({
    super.key, 
    required this.title,
    required this.subtitle,
    //required this.icon,
    bool isObscure = false, // Şifre alanı mı?
    TextInputType inputType =
        TextInputType.text, // Klavye türü (yazı, numara, email)
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
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(
              255,
              255,
              255,
              0.2,
            ),
            hintText: subtitle,
            hintStyle: TextStyle(color: Colors.grey[400]),
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