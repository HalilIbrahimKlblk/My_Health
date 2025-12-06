import 'package:flutter/material.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/logon_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/medicine/medicine_screen.dart';
import '../../screens/analyst/analyst_screen.dart';
import '../../screens/take/take_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String logon = '/logon';
  static const String profile = '/profile';
  static const String medicine = '/medicine';
  static const String analyst = '/analyst';
  static const String take = '/take';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
    logon: (context) => const LogonScreen(),
    medicine: (context) => const MedicineScreen(),
    profile: (context) => const ProfileScreen(),
    analyst: (context) => const AnalystScreen(),
    take: (context) => const TakeScreen(),
  };
}
