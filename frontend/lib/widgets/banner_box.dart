import 'package:flutter/material.dart';

class BannerBox extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final String subtitle;
  final String value;
  final DateTime date;

  const BannerBox({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.subtitle,
    required this.value,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(120, 235, 235, 235),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon + Başlık
          Row(
            children: [
              Icon(icon, color: color, size: 35),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),

          // Value + Subtitle
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 17),
              ),
            ],
          ),

          // Tarih
          Text(
            "${date.day}.${date.month}.${date.year}",
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
