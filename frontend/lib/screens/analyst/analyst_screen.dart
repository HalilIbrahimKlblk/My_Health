import 'package:flutter/material.dart';
import 'package:my_health/widgets/button_box.dart';
import 'package:my_health/widgets/chart_analyst.dart';
import '../../widgets/notification_icon.dart';

class AnalystScreen extends StatelessWidget {
  const AnalystScreen({super.key});

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
                  "Analiz",
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
            Center(
              child: Text(
                "Ölçülen değerleri takip et,\nhatırlatmaları yönet",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 50, 50, 50),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 1.Satır
            ButtonBox(
              icon: Icons.lightbulb_outline,
              color: Colors.orange,
              title: "Öneri Sistemi",
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
                      SizedBox(
                        width: 60,
                        child: Icon(Icons.save, size: 25, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Kaydet",
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
                      SizedBox(
                        width: 60,
                        child: Icon(
                          Icons.device_hub,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Cihazlar",
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
                      SizedBox(
                        width: 60,
                        child: Icon(Icons.share, size: 25, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Paylaş",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // 3. Satır
            ChartAnalyst(
              title: "Tansiyon",
              chart: const AssetImage("assets/images/tansiyon.png"),
              value: "120/80",
              unit: " mmHg",
            ),
            // 4. Satır
            ChartAnalyst(
              title: "Şeker",
              chart: const AssetImage("assets/images/sugar.png"),
              value: "120",
              unit: " mg/dL",
            ),
            // 5. Satır
            ChartAnalyst(
              title: "Nabız",
              chart: const AssetImage("assets/images/nabiz.png"),
              value: "80",
              unit: " bpm",
            ),
          ],
        ),
      ),
    );
  }
}