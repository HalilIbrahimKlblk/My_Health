import 'package:flutter/material.dart';
import 'package:my_health/screens/analyst/analyst_screen.dart';
import 'package:my_health/screens/measure/measure_screen.dart';
import '../../widgets/bottom_navbar.dart';
import '../screens/home/home_screen.dart';
import '../screens/medicine/medicine_screen.dart';
import '../screens/profile/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MedicineScreen(),
    MeasureScreen(),
    AnalystScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
