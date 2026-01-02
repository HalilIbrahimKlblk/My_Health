import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart'; // Senin dosya yolun
import '../main_page.dart'; // Senin dosya yolun

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false; // "Beni Hatırla" checkbox durumu için

  @override
  Widget build(BuildContext context) {
    // Tasarımdaki koyu mavi renk
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white, // Alt kısım beyaz
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- ÜST KISIM (MAVI ALAN) ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
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

                  // LOGO VE BAŞLIK
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

                  // E-MAIL ALANI
                  const Text("E-Mail", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 8),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(
                        0.2,
                      ), // Yarı saydam arka plan
                      hintText: "E-Mailinizi giriniz",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ŞİFRE ALANI
                  const Text("Şifre", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 8),
                  TextField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      hintText: "Şifrenizi giriniz",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // BENİ HATIRLA & ŞİFREMİ UNUTTUM
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

                  // GİRİŞ YAP BUTONU (Beyaz Buton)
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
                        foregroundColor: primaryColor, // Yazı rengi mavi
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

                  // KAYIT OL BUTONU (Koyu Buton)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.logon),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFF0F1430,
                        ), // Daha koyu bir lacivert
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

            // --- ALT KISIM (BEYAZ ALAN - SOSYAL MEDYA) ---
            const SizedBox(height: 30),

            // Sosyal Medya İkonları
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(
                  Colors.white,
                  "assets/google.png",
                  Colors.red,
                ), // Asset yoksa renkli icon kullanır
                const SizedBox(width: 20),
                _buildSocialIcon(
                  Colors.white,
                  "assets/facebook.png",
                  Colors.blue[800]!,
                ),
                const SizedBox(width: 20),
                _buildSocialIcon(
                  Colors.white,
                  "assets/instagram.png",
                  Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 40),

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

  // Sosyal Medya Butonu Yardımcı Widget'ı
  // Not: Eğer resim dosyaların (png) yoksa bu kod icon gösterir.
  Widget _buildSocialIcon(Color bgColor, String assetPath, Color iconColor) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: iconColor, width: 2),
        color: bgColor,
      ),
      child: Center(
        // Resimlerin varsa Image.asset(assetPath) kullanabilirsin.
        // Burada örnek olarak Icon kullanıyorum:
        child: Icon(
          assetPath.contains("google")
              ? Icons.g_mobiledata
              : assetPath.contains("facebook")
              ? Icons.facebook
              : Icons.camera_alt,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}
