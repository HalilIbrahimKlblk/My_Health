import 'package:flutter/material.dart';
import 'logon_screen.dart'; // LogonScreen dosyanın aynı klasörde olduğunu varsayıyorum
import '../main_page.dart'; // Ana sayfanın yolu (kendi yoluna göre düzenle)

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isRememberMe = false;
  bool isPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Şifre controller
  final TextEditingController _passwordController = TextEditingController();

  // Animasyon
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Sayfa açılış animasyonu
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeIn));
    _animController.forward();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _animController.dispose();
    super.dispose();
  }

  // Giriş Butonu Mantığı
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Başarılı giriş
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()), // Ana sayfaya git
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Lütfen bilgileri doğru formatta giriniz."),
        ),
      );
    }
  }

  // Şifremi Unuttum Dialogu
  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Şifremi Unuttum"),
          content: const Text(
            "Şifre yenileme bağlantısı mail adresinize gönderilecektir.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tamam"),
            ),
          ],
        );
      },
    );
  }

  // Sosyal Medya Linki (Temsili)
  void _openSocialLink(String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$platform ile giriş yapılıyor..."),
        backgroundColor: Colors.indigo,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // --- ÜST KISIM (MAVI ALAN) ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 60,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Logo ve Başlık (Fade Animasyonlu)
                    Center(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
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
                    ),
                    const SizedBox(height: 50),

                    // --- E-MAIL ALANI (Autocomplete + Kırmızı İmleç) ---
                    const Text("E-Mail", style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 8),
                    RawAutocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty)
                          return const Iterable<String>.empty();
                        if (!textEditingValue.text.contains('@')) {
                          return ['${textEditingValue.text}@gmail.com'];
                        }
                        return const Iterable<String>.empty();
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String option = options.elementAt(
                                    index,
                                  );
                                  return ListTile(
                                    leading: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.indigo,
                                    ),
                                    title: Text(option),
                                    onTap: () => onSelected(option),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      fieldViewBuilder:
                          (
                            context,
                            textEditingController,
                            focusNode,
                            onFieldSubmitted,
                          ) {
                            return TextFormField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              style: const TextStyle(color: Colors.white),
                              // --- İMLEÇ AYARLARI ---
                              cursorColor: Colors.redAccent,
                              cursorWidth: 3.0,
                              cursorRadius: const Radius.circular(8.0),
                              // ----------------------
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Lütfen mail adresinizi giriniz';
                                if (!value.trim().endsWith('@gmail.com'))
                                  return 'Sadece @gmail.com kabul edilir.';
                                return null;
                              },
                              decoration: _inputDecoration(
                                "E-Mailinizi giriniz",
                                Icons.email,
                              ),
                            );
                          },
                    ),

                    const SizedBox(height: 20),

                    // --- ŞİFRE ALANI ---
                    const Text("Şifre", style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !isPasswordVisible,
                      style: const TextStyle(color: Colors.white),
                      // --- İMLEÇ AYARLARI ---
                      cursorColor: Colors.redAccent,
                      cursorWidth: 3.0,
                      cursorRadius: const Radius.circular(8.0),
                      // ----------------------
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Lütfen şifrenizi giriniz';
                        if (value.length < 6)
                          return 'Şifre en az 6 karakter olmalıdır';
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        hintText: "Şifrenizi giriniz",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white70,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        errorStyle: const TextStyle(color: Colors.orangeAccent),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // --- BENİ HATIRLA & ŞİFREMİ UNUTTUM ---
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: _showForgotPasswordDialog,
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

                    // --- GİRİŞ BUTONU ---
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
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

                    // --- KAYIT OL BUTONU (GEÇİŞ EKLENDİ) ---
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // KAYIT SAYFASINA GEÇİŞ
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LogonScreen(),
                            ),
                          );
                        },
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

              // --- ALT KISIM (SOSYAL MEDYA) ---
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(
                          Colors.white,
                          "assets/google.png",
                          Colors.red,
                          () => _openSocialLink("Google"),
                        ),
                        const SizedBox(width: 20),
                        _buildSocialIcon(
                          Colors.white,
                          "assets/facebook.png",
                          Colors.blue[800]!,
                          () => _openSocialLink("Facebook"),
                        ),
                        const SizedBox(width: 20),
                        _buildSocialIcon(
                          Colors.white,
                          "assets/instagram.png",
                          Colors.purple,
                          () => _openSocialLink("Instagram"),
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
            ],
          ),
        ),
      ),
    );
  }

  // Ortak Input Decoration
  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400]),
      prefixIcon: Icon(icon, color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      errorStyle: const TextStyle(color: Colors.orangeAccent),
    );
  }

  // Sosyal Medya İkon Helper
  Widget _buildSocialIcon(
    Color bgColor,
    String assetPath,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: iconColor, width: 2),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
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
      ),
    );
  }
}
