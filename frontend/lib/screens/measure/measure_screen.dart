import 'package:flutter/material.dart';
import '../../widgets/notification_icon.dart';
import '../../widgets/banner_box.dart';
import '../../screens/take/take_screen.dart';

class MeasureScreen extends StatelessWidget {
  const MeasureScreen({super.key});

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
                  "Ölçüm",
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
            // Banner
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BannerBox(
                      color: Colors.green,
                      title: "Tansiyon",
                      value: "120/80",
                      subtitle: "mmHg",
                      icon: Icons.monitor_heart_outlined,
                      date: DateTime(2024, 6, 15),
                    ),
                    BannerBox(
                      color: Colors.orange,
                      title: "Şeker",
                      value: "120",
                      subtitle: "mg/dL",
                      icon: Icons.cake_outlined,
                      date: DateTime(2024, 6, 15),
                    ),
                    BannerBox(
                      color: Colors.red,
                      value: "72",
                      title: "Nabız",
                      subtitle: "bpm",
                      icon: Icons.favorite_outline,
                      date: DateTime(2024, 6, 15),
                    ),
                    // Yeni Ölçüm Ekle
                    Container(
                      width: 175,
                      height: 130,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 235, 235, 235),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 36, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                              "Yeni Ölçüm Ekle",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 1. Satır
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TakeScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                      children: [
                        SizedBox(
                          width: 60,
                          child: Icon(
                            Icons.speed,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text("Ölçüm Yap", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 10),
                              Icon(
                                Icons.bluetooth_connected,
                                size: 22.5,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
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
                  height: boxSize * 1 / 2.75,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: colorPalette,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Sol TextField
                      Expanded(
                        child: Container(
                          height: 42.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black54,
                              width: 0.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          alignment: Alignment.center,
                          child: const TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "/",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Sağ TextField
                      Expanded(
                        child: Container(
                          height: 42.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black54,
                              width: 0.5,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          alignment: Alignment.center,
                          child: const TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "mmHg",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(width: 40),
                      // Kaydet butonu
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Kaydet",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.save, size: 20, color: Colors.white),
                          ],
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
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Icon(
                          Icons.description_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Ölçüm Notu Ekle",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
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
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Icon(
                          Icons.hourglass_top,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Ölçüm Hatırlatıcı",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: boxSize * 2 + 20,
                  height: 250,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/chart.png"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: borderPalette, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Tansiyon Grafiği",
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 100, 100, 100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
