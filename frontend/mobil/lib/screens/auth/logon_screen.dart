import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_health/widgets/input_line.dart';
import 'package:my_health/services/api_service.dart';

class LogonScreen extends StatefulWidget {
  const LogonScreen({super.key});

  @override
  State<LogonScreen> createState() => _LogonScreenState();
}

class _LogonScreenState extends State<LogonScreen> {
  bool isKvkAgreed = false;
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController = TextEditingController();


  void _showSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.monitor_heart, color: Colors.redAccent, size: 36),
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
                  InputLine(
                    title: "Ad",
                    subtitle: "Adınızı giriniz",
                    icon: Icons.person,
                    inputType: TextInputType.name,
                    controller: nameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZçÇğĞıİöÖşŞüÜ\s]")),
                    ],
                  ),
                  const SizedBox(height: 15),
                  InputLine(
                    title: "Soyad",
                    subtitle: "Soyadınızı giriniz",
                    icon: Icons.person,
                    inputType: TextInputType.name,
                    controller: surnameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-ZçÇğĞıİöÖşŞüÜ\s]")),
                    ],
                  ),
                  const SizedBox(height: 15),
                  InputLine(
                    title: "E-Mail",
                    subtitle: "E-Mailinizi giriniz",
                    icon: Icons.mail,
                    inputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  InputLine(
                    title: "Şifre",
                    subtitle: "Şifrenizi giriniz",
                    icon: Icons.key,
                    isObscure: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 15),
                  InputLine(
                    title: "Şifre Tekrar",
                    subtitle: "Şifrenizi giriniz",
                    icon: Icons.lock,
                    isObscure: true,
                    controller: passwordRepeatController,
                  ),
                  const SizedBox(height: 20),
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
                          onTap: () => setState(() => isKvkAgreed = !isKvkAgreed),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.white, fontSize: 12),
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (!isKvkAgreed) {
                                _showSnackBar(context, "Lütfen KVK sözleşmesini onaylayın!");
                                return;
                              }
                              if (passwordController.text != passwordRepeatController.text) {
                                _showSnackBar(context, "Şifreler uyuşmuyor!");
                                return;
                              }
                              if (nameController.text.trim().isEmpty ||
                                  surnameController.text.trim().isEmpty ||
                                  emailController.text.trim().isEmpty) {
                                _showSnackBar(context, "Lütfen tüm alanları doldurun!");
                                return;
                              }

                              setState(() => isLoading = true);

                              try {
                                ApiService apiService = ApiService();
                                bool isSuccess = await apiService.saveUser(
                                  name: nameController.text.trim(),
                                  surname: surnameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                                // KRİTİK NOKTA: Sadece 'mounted' değil, 'context.mounted' kontrolü yapıyoruz
                                if (!context.mounted) return;

                                setState(() => isLoading = false);

                                if (isSuccess) {
                                  _showSnackBar(context, "Kayıt Başarılı!");
                                  Navigator.pop(context);
                                } else {
                                  _showSnackBar(context, "Kayıt başarısız oldu.");
                                }
                              } catch (e) {
                                if (!context.mounted) return;
                                setState(() => isLoading = false);
                                _showSnackBar(context, "Hata oluştu: $e");
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: primaryColor,
                                strokeWidth: 3,
                              ),
                            )
                          : const Text(
                              "Kayıt Ol",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Copyright 2026 © Final Project",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}