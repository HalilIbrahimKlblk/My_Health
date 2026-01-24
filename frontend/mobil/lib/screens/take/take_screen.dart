import 'package:flutter/material.dart';
import 'dart:math' as math; 
import '../analyst/analyst_screen.dart';

class TakeScreen extends StatefulWidget {
  const TakeScreen({super.key});

  @override
  State<TakeScreen> createState() => _TakeScreenState();
}

class _TakeScreenState extends State<TakeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.15,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/health_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        double offsetY = math.sin(_controller.value * 2 * math.pi + (index * 0.8)) * 5;
                        
                        return Transform.translate(
                          offset: Offset(0, offsetY), 
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text("●", style: TextStyle(fontSize: 18)),
                          ),
                        );
                      }),
                    );
                  },
                ),
                
                const SizedBox(height: 16),

                const Text(
                  "Ölçüm Yapılıyor",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Alt Buton
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnalystScreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                  child: Text("Tamam", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}