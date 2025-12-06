import 'package:flutter/material.dart';

class LogonScreen extends StatelessWidget {
  const LogonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Logon")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Logon Sayfası"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);   // Login’e geri döner
              },
              child: const Text("Kayıt Ol ve Geri Dön"),
            ),
          ],
        ),
      ),
    );
  }
}
