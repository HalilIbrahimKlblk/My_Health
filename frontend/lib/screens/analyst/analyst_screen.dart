import 'package:flutter/material.dart';
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
                          Icons.lightbulb_outline,
                          size: 30,
                          color: Colors.orange,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Öneri Sistemi",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tansiyon",
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
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
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
                            DropdownMenuItem(
                              value: "1 Gün",
                              child: Text("1 Gün"),
                            ),
                            DropdownMenuItem(
                              value: "1 Hafta",
                              child: Text("1 Hafta"),
                            ),
                            DropdownMenuItem(
                              value: "1 Ay",
                              child: Text("1 Ay"),
                            ),
                            DropdownMenuItem(
                              value: "1 Yıl",
                              child: Text("1 Yıl"),
                            ),
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
                      image: const DecorationImage(
                        image: AssetImage("assets/images/tansiyon.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 19, color: Colors.grey[700]),
                      children: const [
                        TextSpan(text: "Ortalama: "),
                        TextSpan(
                          text: "120/80",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        TextSpan(text: " mmHg"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 4. Satır
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Şeker",
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
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
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
                            DropdownMenuItem(
                              value: "1 Gün",
                              child: Text("1 Gün"),
                            ),
                            DropdownMenuItem(
                              value: "1 Hafta",
                              child: Text("1 Hafta"),
                            ),
                            DropdownMenuItem(
                              value: "1 Ay",
                              child: Text("1 Ay"),
                            ),
                            DropdownMenuItem(
                              value: "1 Yıl",
                              child: Text("1 Yıl"),
                            ),
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
                      image: const DecorationImage(
                        image: AssetImage("assets/images/sugar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 19, color: Colors.grey[700]),
                      children: const [
                        TextSpan(text: "Ortalama: "),
                        TextSpan(
                          text: "120",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        TextSpan(text: " mg/dL"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 5. Satır
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nabız",
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
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
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
                            DropdownMenuItem(
                              value: "1 Gün",
                              child: Text("1 Gün"),
                            ),
                            DropdownMenuItem(
                              value: "1 Hafta",
                              child: Text("1 Hafta"),
                            ),
                            DropdownMenuItem(
                              value: "1 Ay",
                              child: Text("1 Ay"),
                            ),
                            DropdownMenuItem(
                              value: "1 Yıl",
                              child: Text("1 Yıl"),
                            ),
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
                      image: const DecorationImage(
                        image: AssetImage("assets/images/nabiz.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 19, color: Colors.grey[700]),
                      children: const [
                        TextSpan(text: "Ortalama: "),
                        TextSpan(
                          text: "80",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ),
                        TextSpan(text: " bpm"),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // 5. Satır
          ],
        ),
      ),
    );
  }
}
