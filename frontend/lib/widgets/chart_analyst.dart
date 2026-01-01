import 'package:flutter/material.dart';

class ChartAnalyst extends StatelessWidget {
  final String title;
  final ImageProvider chart;
  final String value;
  final String unit;

  const ChartAnalyst({
    super.key,
    required this.title,
    required this.chart,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  value: "1 Hafta",
                  isDense: true,
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black87,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  items: const [
                    DropdownMenuItem(value: "1 Gün", child: Text("1 Gün")),
                    DropdownMenuItem(value: "1 Hafta", child: Text("1 Hafta")),
                    DropdownMenuItem(value: "1 Ay", child: Text("1 Ay")),
                    DropdownMenuItem(value: "1 Yıl", child: Text("1 Yıl")),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: chart, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 19, color: Colors.grey[700]),
              children: [
                TextSpan(text: "Ortalama: "),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 40, 40, 40),
                  ),
                ),
                TextSpan(text: unit),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
