import 'package:flutter/material.dart';
import '../../widgets/notification_icon.dart';

class AnalystScreen extends StatelessWidget {
  const AnalystScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Analiz Sayfası",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 50, 50, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
