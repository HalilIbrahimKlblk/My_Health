import 'package:flutter/material.dart';
import '../../widgets/notification_icon.dart';

class AnalystScreen extends StatelessWidget {
  const AnalystScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Analiz",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0, top: 20),
            child: NotificationIcon(),
          ),
        ],
      ),
      body: const Center(child: Text("Analiz Sayfası")),
    );
  }
}
