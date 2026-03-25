import 'package:flutter/material.dart';
import '../../widgets/notification_icon.dart';

class ResultScreen extends StatelessWidget {
  final int systolic;
  final int diastolic;

  const ResultScreen({
    super.key,
    required this.systolic,
    required this.diastolic,
  });

  String _getResultText() {
    if (systolic < 90 || diastolic < 60) return "Düşük tansiyon";
    if (systolic < 120 && diastolic < 80) return "Normal";
    if (systolic < 140 && diastolic < 90) return "Yüksek (Prehipertansiyon)";
    return "Hipertansiyon";
  }

  Color _getResultColor() {
    if (systolic < 90 || diastolic < 60) return Colors.blue;
    if (systolic < 120 && diastolic < 80) return Colors.green;
    if (systolic < 140 && diastolic < 90) return Colors.orange;
    return Colors.red;
  }

  String _getAdvice() {
    if (systolic < 90 || diastolic < 60) {
      return "Bol su içmeli ve ani hareketlerden kaçınmalısınız.";
    } else if (systolic < 120 && diastolic < 80) {
      return "Harika! Sağlıklı yaşam tarzına devam edin.";
    } else if (systolic < 140 && diastolic < 90) {
      return "Tuz tüketimini azaltmalı ve egzersiz yapmalısınız.";
    } else {
      return "Bir doktora başvurmanız önerilir.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getResultColor();
    final lastMeasurementTime =
        "${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month.toString().padLeft(2, '0')}.${DateTime.now().year} "
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F6FA),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "Sonuç",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: NotificationIcon(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(37.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.8),
                    color.withValues(alpha: 0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: color.withValues(alpha: 0.3),
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Tansiyon",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$systolic / $diastolic",
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "mmHg",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getResultText(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 📊 DETAY
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.analytics),
                      SizedBox(width: 10),
                      Text(
                        "Detaylar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("Sistolik"), Text("$systolic mmHg")],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Diyastolik"),
                      Text("$diastolic mmHg"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 💡 ÖNERİ
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: color),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(_getAdvice(), style: TextStyle(color: color)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🕒 SON ÖLÇÜM ZAMANI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 10),
                  Text(
                    "Son Ölçüm: $lastMeasurementTime",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
