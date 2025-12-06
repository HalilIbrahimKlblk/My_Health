import 'package:flutter/material.dart';
import '../analyst/analyst_screen.dart'; 

class TakeScreen extends StatelessWidget {
  const TakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Arka plan resmi
          Opacity(
            opacity: 0.15, 
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/health_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // İçerik
          const Center(
            child: Text(
              "Ölçüm Yapılıyor",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Colors.black26,
                  )
                ],
              ),
            ),
          ),
          // Alt kısımdaki Tamam butonu
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  // Analiz sayfasına git
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnalystScreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                  child: Text(
                    "Tamam",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
