import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),
          label: "İlaçlarım",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.speed), label: "Ölçüm"),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analiz"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hesabım"),
      ],
    );
  }
}
