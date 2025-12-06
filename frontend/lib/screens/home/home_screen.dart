import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSize = screenWidth * 0.4;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Column(
              children: [
                // 1. Satır
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: boxSize,
                      height: boxSize,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      width: boxSize,
                      height: boxSize,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),

                // 2. Satır
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: boxSize * 2 + 20,
                      height: boxSize * 1 / 2,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 172, 215, 174),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),

                // 3. Satır
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: boxSize,
                      height: boxSize,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      width: boxSize,
                      height: boxSize,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),

                // 4. Satır
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: boxSize,
                      height: boxSize,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      width: boxSize,
                      height: boxSize,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),

                // 5. Satır
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: boxSize * 2 + 20,
                      height: boxSize * 1 / 2.75,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 172, 215, 174),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 35, 35, 35),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
