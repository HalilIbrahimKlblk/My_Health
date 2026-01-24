import 'package:flutter/material.dart';
import 'package:my_health/widgets/input_line.dart';

class LogonScreen extends StatefulWidget {
  const LogonScreen({super.key});

  @override
  State<LogonScreen> createState() => _LogonScreenState();
}

class _LogonScreenState extends State<LogonScreen> {
  bool isKvkAgreed = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ============================================================
            // 1. BÖLÜM: ÜSTTEKİ MAVİ ALAN (FORM ALANI)
            // ============================================================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // --- LOGO VE BAŞLIK ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monitor_heart,
                        color: Colors.redAccent,
                        size: 36,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "My Health",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Ad Alanı
                  InputLine(title: "Ad", subtitle: "Adınızı giriniz"),
                  const SizedBox(height: 15),
                  // Soyad Alanı
                  InputLine(title: "Soyad", subtitle: "Soyadınızı giriniz"),
                  const SizedBox(height: 15),
                  // Telefon Alanı
                  InputLine(title: "Telefon", subtitle: "Telefonunuzu giriniz"),
                  const SizedBox(height: 15),
                  // Mail Alanı
                  InputLine(title: "E-Mail", subtitle: "E-Mailinizi giriniz"),
                  const SizedBox(height: 15),
                  // Şifre Alanı
                  InputLine(title: "Şifre", subtitle: "Şifrenizi giriniz"),
                  const SizedBox(height: 15),
                  // Şifre Alanı
                  InputLine(title: "Şifre Tekrar", subtitle: "Şifrenizi giriniz"),
                  const SizedBox(height: 20),
                  // Kvk Sözleşmesi
                  Row(
                    children: [
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: Checkbox(
                          value: isKvkAgreed,
                          activeColor: Colors.white,
                          checkColor: primaryColor,
                          side: const BorderSide(color: Colors.white, width: 2),
                          onChanged: (val) {
                            setState(() {
                              isKvkAgreed = val ?? false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isKvkAgreed = !isKvkAgreed;
                            });
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: "KVK Sözleşmesini",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: " okudum, kabul ediyorum."),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Kayıt Ol
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Copyright Text
            Text(
              "Copyright 2025 © Final Project",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
