import 'package:flutter/material.dart';
import 'package:my_health/widgets/input_line.dart';
import '../../core/routes/app_routes.dart';
import '../main_page.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false; // Beni Hatırla

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Üst Kısım (mavi)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Logo-Başlık
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.monitor_heart,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "My Health",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Mail Alanı
                  InputLine(title: "E-Mail", subtitle: "E-Mailinizi giriniz"),
                  const SizedBox(height: 20),
                  // Şifre Alanı
                  InputLine(title: "Şifre", subtitle: "Şifrenizi giriniz"),
                  const SizedBox(height: 10),

                  // Beni Hatırla-Şifremi Unuttum
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.white,
                            ),
                            child: Checkbox(
                              value: isRememberMe,
                              checkColor: primaryColor,
                              activeColor: Colors.white,
                              onChanged: (val) {
                                setState(() {
                                  isRememberMe = val ?? false;
                                });
                              },
                            ),
                          ),
                          const Text(
                            "Beni Hatırla",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Şifremi Unuttum",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Giriş Yap
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MainPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Giriş",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Kayıt Ol
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.logon),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F1430),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Kayıt Ol",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Sosyal Medya İkonları
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialIcon(
                  bgColor: Colors.white,
                  imagePath: "assets/icons/google.png",
                  onTap: () {
                    launchUrl(
                      Uri.parse("https://www.google.com"),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
                const SizedBox(width: 20),
                buildSocialIcon(
                  bgColor: Colors.white,
                  imagePath: "assets/icons/facebook.png",
                  onTap: () {
                    launchUrl(
                      Uri.parse("https://www.facebook.com"),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
                const SizedBox(width: 20),
                buildSocialIcon(
                  bgColor: Colors.white,
                  imagePath: "assets/icons/instagram.png",
                  onTap: () {
                    launchUrl(
                      Uri.parse("https://www.instagram.com"),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
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

  // Sosyal Medya Butonu
  Widget buildSocialIcon({
    required Color bgColor,
    required String imagePath,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}