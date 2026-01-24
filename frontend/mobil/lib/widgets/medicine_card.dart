import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String subtitle;
  final String repeat;
  final String importance;

  const MedicineCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.repeat,
    required this.importance,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSize = screenWidth * 0.4;

    final borderSize = 0.6;
    final colorPalette = const Color.fromARGB(120, 235, 235, 235);
    final borderPalette = Colors.grey;

    Color textColor;
    Color bgColor;

    switch (importance.toLowerCase()) {
      case "orta":
        textColor = Colors.orange.shade700;
        bgColor = Colors.orange.shade100;
        break;
      case "normal":
        textColor = Colors.green.shade700;
        bgColor = Colors.green.shade100;
        break;
      case "önemli":
        textColor = Colors.red.shade700;
        bgColor = Colors.red.shade100;
        break;
      default:
        textColor = Colors.grey.shade700;
        bgColor = Colors.grey.shade200;
    }

    return Center(
      child: Container(
        width: boxSize * 2 + 20,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorPalette,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderPalette, width: borderSize),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sol Taraf
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(image: image, fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _actionButton(
                        icon: Icons.check_circle,
                        text: "İçtim",
                        color: Colors.green,
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      _actionButton(
                        icon: Icons.cancel,
                        text: "İçmedim",
                        color: Colors.red,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

            // Sağ Taraf
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 6),
                  Divider(thickness: 1.2),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          repeat,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.2),
                  Row(
                    children: [
                      Text(
                        "Önem Derecesi:",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          importance,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _iconButton(
                          icon: Icons.assignment,
                          text: "E-Reçete",
                          onTap: () {},
                          left: true,
                        ),
                      ),
                      Expanded(
                        child: _iconButton(
                          icon: Icons.delete,
                          text: "Sil",
                          onTap: () {},
                          left: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withAlpha(102)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 4),
            Text(text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required bool left,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.horizontal(
            left: left ? const Radius.circular(10) : Radius.zero,
            right: !left ? const Radius.circular(10) : Radius.zero,
          ),
          border: Border.all(color: Colors.grey.shade600),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 6),
            Text(text),
          ],
        ),
      ),
    );
  }
}
