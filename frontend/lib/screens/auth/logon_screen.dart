import 'package:flutter/material.dart';

class LogonScreen extends StatefulWidget {
  const LogonScreen({super.key});

  @override
  State<LogonScreen> createState() => _LogonScreenState();
}

class _LogonScreenState extends State<LogonScreen> {
  // KVK Sözleşmesi onay durumu
  bool isKvkAgreed = false;

  @override
  Widget build(BuildContext context) {
    // Tasarımdaki ana tema rengi (Login ekranı ile aynı)
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white, // Alt kısım beyaz
      // Klavye açıldığında taşma hatası almamak için kaydırılabilir yapı
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
                  const SizedBox(height: 30),

                  // --- FORM GİRİŞ KUTUCUKLARI ---
                  // Kod tekrarını önlemek için aşağıda yazdığımız yardımcı fonksiyonu kullanıyoruz.
                  _buildCustomTextField(label: "Ad", hint: "Adınızı giriniz"),
                  const SizedBox(height: 15),

                  _buildCustomTextField(
                    label: "Soyad",
                    hint: "Soyadınızı giriniz",
                  ),
                  const SizedBox(height: 15),

                  _buildCustomTextField(
                    label: "Telefon",
                    hint: "Telefonunuzu giriniz",
                    inputType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),

                  _buildCustomTextField(
                    label: "E-Mail",
                    hint: "E-Mailinizi giriniz",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),

                  _buildCustomTextField(
                    label: "Şifre",
                    hint: "Şifrenizi giriniz",
                    isObscure: true,
                  ),

                  const SizedBox(height: 20),

                  // --- KVK SÖZLEŞMESİ (CHECKBOX) ---
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
                            // Yazıya tıklayınca da checkbox değişsin
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

                  // --- KAYIT OL BUTONU ---
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Kayıt işlemi başarılıysa bir önceki ekrana (Login) dön
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

            // ============================================================
            // 2. BÖLÜM: ALTTAKİ COPYRIGHT ALANI
            // ============================================================
            const SizedBox(height: 30),
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

  // --- YARDIMCI FONKSİYON: INPUT FIELD ---
  // Her bir kutucuk için (Ad, Soyad, Telefon vs.) aynı tasarımı tekrar yazmak yerine
  // bu fonksiyonu çağırıyoruz. Kodun okunabilirliğini artırır.
  Widget _buildCustomTextField({
    required String label,
    required String hint,
    bool isObscure = false, // Şifre alanı mı?
    TextInputType inputType =
        TextInputType.text, // Klavye türü (yazı, numara, email)
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 6),
        TextField(
          obscureText: isObscure,
          keyboardType: inputType,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3), // Yarı saydam arka plan
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[300]),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
