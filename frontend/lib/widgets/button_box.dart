import 'package:flutter/material.dart';

class ButtonBox extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String title;
  final IconData? titleIcon;
  final Color? titleIconColor;
  final VoidCallback? onTap;

  const ButtonBox({
    super.key,
    required this.icon,
    this.color,
    required this.title,
    this.titleIcon,
    this.titleIconColor,
    this.onTap, // Opsiyonel olarak constructor'a ekledik
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSize = screenWidth * 0.4;

    const borderSize = 0.6;
    final colorPalette = const Color.fromARGB(120, 235, 235, 235);
    final borderPalette = Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: boxSize * 2 + 20,
            height: boxSize / 2.75,
            margin: const EdgeInsets.all(10),
            // Tıklama efekti ve kenarlıkların düzgün çalışması için Material + InkWell yapısı:
            decoration: BoxDecoration(
              color: colorPalette, // Arka plan rengi
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderPalette, width: borderSize),
            ),
            child: Material(
              color: Colors.transparent, // Container rengini korumak için şeffaf
              child: InkWell(
                borderRadius: BorderRadius.circular(8), // Tıklama efektinin köşeleri taşmasın
                onTap: onTap, // Eğer null ise buton tıklanmaz, doluysa fonksiyon çalışır
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0), // İsteğe bağlı padding
                  child: Row(
                    children: [
                      SizedBox(width: 60, child: Icon(icon, size: 30, color: color)),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (titleIcon != null) ...[
                              const SizedBox(width: 10),
                              Icon(
                                titleIcon,
                                size: 23,
                                color: titleIconColor ?? Colors.black,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}