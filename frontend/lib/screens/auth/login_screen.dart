import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import '../main_page.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login sayfasına Hoşgeldiniz"),

            // ---- GİRİŞ YAP ----
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainPage()),
                );
              },
              child: const Text("Giriş Yap"),
            ),

            // ---- KAYIT OL ----
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.logon),
              child: const Text("Kayıt Ol"),
            ),
          ],
        ),
      ),
    );
  }
}
