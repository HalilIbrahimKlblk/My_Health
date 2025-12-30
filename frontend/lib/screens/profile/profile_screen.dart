import 'package:flutter/material.dart';
import 'package:my_health/widgets/button_box.dart';
import '../../widgets/notification_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSize = screenWidth * 0.4;

    final borderSize = 0.6;
    final colorPalette = Color.fromARGB(120, 235, 235, 235);
    final borderPalette = Colors.grey.shade400;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, inner) {
          return [
            SliverAppBar(
              centerTitle: true,
              floating: false,
              snap: false,
              pinned: false,
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

        body: ListView(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // 1. Satır
                Center(
                  child: Container(
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
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 7.5),
                        Icon(
                          Icons.qr_code_2_rounded,
                          size: 70,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: screenWidth / 2 - (boxSize * 0.6),
                  child: Container(
                    width: boxSize * 1.2,
                    height: boxSize * 1.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: borderPalette, width: 1.5),
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
                    border: Border.all(color: borderPalette, width: borderSize),
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
                        style: TextStyle(fontSize: 22, color: Colors.black),
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
                    border: Border.all(color: borderPalette, width: borderSize),
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
                        style: TextStyle(fontSize: 22, color: Colors.black),
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
                    border: Border.all(color: borderPalette, width: borderSize),
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
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // 3. Satır
            ButtonBox(icon: Icons.person_outline, title: "Kişisel Bilgiler"),
            // 4. Satır
            ButtonBox(icon: Icons.call_outlined, title: "İletişim Bilgileri"),
            // 5. Satır
            ButtonBox(icon: Icons.healing_outlined, title: "Sağlık Profili"),
            // 6. Satır
            ButtonBox(
              icon: Icons.security_outlined,
              title: "Hesap ve Güvenlik",
            ),
            // 7. Satır
            ButtonBox(
              icon: Icons.share_outlined,
              title: "Veri Paylaşımı ve İzinler",
            ),
            // 8. Satır
            ButtonBox(icon: Icons.devices_outlined, title: "Cihazlarım"),
            // 9. Satır
            ButtonBox(icon: Icons.help_outline, title: "Destek ve Yardım"),
            const SizedBox(height: 2),
            Center(
              child: Text(
                "Uygulama Sürümü: 1.1.0",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 100, 100, 100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
