import 'package:flutter/material.dart';
import 'package:my_health/widgets/button_box.dart';
import '../../widgets/notification_icon.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_health/widgets/medicine_card.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxSize = screenWidth * 0.4;

    final borderSize = 0.6;
    final colorPalette = Color.fromARGB(120, 235, 235, 235);
    final borderPalette = Colors.grey.shade400;

    final DateTime today = DateTime.now();
    final DateTime sixLastMonth = DateTime(
      today.year,
      today.month + 6,
      today.day,
    );

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
              backgroundColor: Colors.white,
              title: const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "İlaçlarım",
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
                "Kullandığın ilaçları takip et,",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 50, 50, 50),
                ),
              ),
            ),
            Center(
              child: Text(
                "hatırlatmaları yönet",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 50, 50, 50),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: boxSize * 2 + 20,
                  height: boxSize * 0.55,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorPalette,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Toplam İlaç",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "3",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bugün Alınacak",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "3",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Unutulanlar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: boxSize * 1.5,
                  height: boxSize * 0.40,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorPalette,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: 32,
                          color: Colors.black,
                        ),
                        SizedBox(width: 7.5),
                        Text(
                          "İlaç Ekle",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: boxSize * 0.5,
                  height: boxSize * 0.40,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorPalette,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code_scanner,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: boxSize * 2 + 20,
                  height: boxSize * 0.25,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorPalette,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: borderPalette, width: borderSize),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // Arama işlevi burada işlenebilir
                    },
                    decoration: InputDecoration(
                      hintText: "İlaç Ara...",
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
            // İlaç Şablonu
            MedicineCard(
              image: const AssetImage('assets/images/parol.jpg'),
              title: "Parol 500 mg",
              subtitle: "Ağrı Kesici",
              repeat: "Sabah - Öğlen - Akşam",
              importance: "Orta",
            ),
            MedicineCard(
              image: const AssetImage('assets/images/aferin.png'),
              title: "Aferin 500 mg",
              subtitle: "Soğuk Algınlığı",
              repeat: "Sabah - Akşam",
              importance: "Önemli",
            ),
            // Hatırlatıcı
            ButtonBox(icon: Icons.hourglass_empty, title: "Hatırlatıcı"),
            // Takvim
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "─ Takvim ─",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 50, 50, 50),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Container(
                        width: boxSize * 2 + 20,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: colorPalette,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderPalette,
                            width: borderSize,
                          ),
                        ),
                        child: TableCalendar(
                          // Bugünden itibaren 6 ayı kapsayacak şekilde ayarlandı
                          firstDay: today,
                          lastDay: sixLastMonth,
                          focusedDay: today,

                          availableGestures: AvailableGestures.horizontalSwipe,
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          calendarStyle: CalendarStyle(
                            weekendTextStyle: TextStyle(color: Colors.red),
                            todayDecoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),

                          selectedDayPredicate: (day) => false,
                          onDaySelected: (d, f) {},
                        ),
                      ),
                    ],
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
