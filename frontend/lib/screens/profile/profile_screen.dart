import 'package:flutter/material.dart';
import '../../widgets/notification_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSize = screenWidth * 0.4;

    final borderSize = 0.6;
    final colorPalette = Color.fromARGB(120, 235, 235, 235);
    final borderPalette = Color.fromARGB(255, 35, 35, 35);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, inner) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              floating: true,
              snap: true,
              elevation: 2,
              title: const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Hesabım",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 15.0),
                  child: NotificationIcon(),
                ),
              ],
            ),
          ];
        },

        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // 1. Satır
                      Container(
                        width: screenWidth * 0.85,
                        height: boxSize * 1.6,
                        margin: const EdgeInsets.only(top: 120, bottom: 10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 100),
                            Text(
                              "Halil İbrahim Kalabalık",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "#245602782",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 7.5),
                            Icon(
                              Icons.qr_code_scanner,
                              size: 70,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 75,
                        right: 75,
                        child: Container(
                          width: boxSize * 1.2,
                          height: boxSize * 1.2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: const Color.fromARGB(255, 62, 62, 62),
                              width: 1.5,
                            ),
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
                        width: boxSize / 1.6,
                        height: boxSize / 1.6,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Yaş",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "21",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: boxSize / 1.6,
                        height: boxSize / 1.6,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Boy",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "182",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: boxSize / 1.6,
                        height: boxSize / 1.6,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Kilo",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "91",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 3. Satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        height: boxSize * 1 / 2.75,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Kişisel Bilgiler",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 4. Satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        height: boxSize * 1 / 2.75,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
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
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 6. Satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        height: boxSize * 1 / 2.75,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 7. Satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        height: boxSize * 1 / 2.75,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 8. Satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        height: boxSize * 1 / 2.75,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 9. Satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        height: boxSize * 1 / 2.75,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
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
      ),
    );
  }
}
