import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogonScreen extends StatefulWidget {
  const LogonScreen({super.key});

  @override
  State<LogonScreen> createState() => _LogonScreenState();
}

class _LogonScreenState extends State<LogonScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Kontrolcüler
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Durum Değişkenleri
  bool isKvkAgreed = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // Animasyon
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeIn));
    _animController.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _animController.dispose();
    super.dispose();
  }

  // Kayıt Ol Butonu Mantığı
  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      if (!isKvkAgreed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Lütfen KVK sözleşmesini onaylayınız."),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
      // Başarılı Kayıt
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Kayıt Başarılı! Giriş ekranına yönlendiriliyorsunuz...",
          ),
          backgroundColor: Colors.green,
        ),
      );
      // 1.5 sn sonra Giriş ekranına dön
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pop(context);
      });
    }
  }

  // KVK Dialog Penceresi
  void _showKvkDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("KVK Aydınlatma Metni"),
        content: const SingleChildScrollView(
          child: Text(
            "Verileriniz 6698 sayılı Kişisel Verilerin Korunması Kanunu kapsamında "
            "işlenmekte ve korunmaktadır. Uygulamamızı kullanarak sağlık verilerinizin "
            "işlenmesine rıza göstermiş olursunuz...",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Okudum, Anladım"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF1E2454);

    return Scaffold(
      backgroundColor: Colors.white,
      // Boşluğa tıklayınca klavyeyi kapat
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // --- ÜST MAVİ ALAN ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
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
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        // Geri Dön Butonu
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),

                        const Icon(
                          Icons.app_registration,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Yeni Hesap Oluştur",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // --- AD SOYAD ---
                        Row(
                          children: [
                            Expanded(
                              child: _buildTextFormField(
                                controller: _nameController,
                                label: "Ad",
                                hint: "Adınız",
                                icon: Icons.person,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildTextFormField(
                                controller: _surnameController,
                                label: "Soyad",
                                hint: "Soyadınız",
                                icon: Icons.person_outline,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // --- TELEFON ---
                        _buildTextFormField(
                          controller: _phoneController,
                          label: "Telefon",
                          hint: "5XX XXX XX XX",
                          icon: Icons.phone_android,
                          inputType: TextInputType.phone,
                          isNumberOnly: true,
                        ),
                        const SizedBox(height: 15),

                        // --- EMAIL (Autocomplete + Kırmızı İmleç) ---
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "E-Mail",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 6),
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          final String option = options
                                              .elementAt(index);
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
                                controller,
                                focusNode,
                                onFieldSubmitted,
                              ) {
                                return TextFormField(
                                  controller: controller,
                                  focusNode: focusNode,
                                  // --- İMLEÇ ---
                                  cursorColor: Colors.redAccent,
                                  cursorWidth: 3.0,
                                  cursorRadius: const Radius.circular(8.0),
                                  // ------------
                                  style: const TextStyle(color: Colors.white),
                                  validator: (val) {
                                    if (val == null || val.isEmpty)
                                      return "E-Mail zorunludur";
                                    if (!val.contains('@'))
                                      return "Geçerli bir mail giriniz";
                                    return null;
                                  },
                                  decoration: _inputDecoration(
                                    "E-Mailinizi giriniz",
                                    Icons.email,
                                  ),
                                );
                              },
                        ),
                        const SizedBox(height: 15),

                        // --- ŞİFRE ---
                        _buildPasswordParams(
                          controller: _passwordController,
                          label: "Şifre",
                          hint: "******",
                          isVisible: isPasswordVisible,
                          onVisibilityChanged: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        const SizedBox(height: 15),

                        // --- ŞİFRE TEKRAR ---
                        _buildPasswordParams(
                          controller: _confirmPasswordController,
                          label: "Şifre Tekrar",
                          hint: "******",
                          isVisible: isConfirmPasswordVisible,
                          onVisibilityChanged: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                          isConfirm: true,
                        ),

                        const SizedBox(height: 20),

                        // --- KVK ---
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                value: isKvkAgreed,
                                checkColor: primaryColor,
                                activeColor: Colors.white,
                                onChanged: (val) {
                                  setState(() {
                                    isKvkAgreed = val ?? false;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: _showKvkDialog,
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "KVK Sözleşmesini ",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: "okudum, onaylıyorum."),
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
                            onPressed: _handleRegister,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 5,
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
                ),

                // --- ALT KISIM ---
                const SizedBox(height: 30),
                Text(
                  "Copyright 2025 © Final Project",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widget: Standart Input (İmleç Kırmızı)
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    bool isNumberOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          // --- İMLEÇ ---
          cursorColor: Colors.redAccent,
          cursorWidth: 3.0,
          cursorRadius: const Radius.circular(8.0),
          // ------------
          style: const TextStyle(color: Colors.white),
          inputFormatters: isNumberOnly
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ]
              : [],
          validator: (val) {
            if (val == null || val.isEmpty) return "$label boş bırakılamaz";
            if (isNumberOnly && val.length < 10)
              return "Geçerli bir numara giriniz";
            return null;
          },
          decoration: _inputDecoration(hint, icon),
        ),
      ],
    );
  }

  // Helper Widget: Şifre Input (İmleç Kırmızı)
  Widget _buildPasswordParams({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback onVisibilityChanged,
    bool isConfirm = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          // --- İMLEÇ ---
          cursorColor: Colors.redAccent,
          cursorWidth: 3.0,
          cursorRadius: const Radius.circular(8.0),
          // ------------
          style: const TextStyle(color: Colors.white),
          validator: (val) {
            if (val == null || val.isEmpty) return "Şifre zorunludur";
            if (val.length < 6) return "En az 6 karakter olmalı";
            if (isConfirm && val != _passwordController.text)
              return "Şifreler eşleşmiyor!";
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: const Icon(Icons.lock, color: Colors.white70),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: onVisibilityChanged,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            errorStyle: const TextStyle(color: Colors.orangeAccent),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400]),
      prefixIcon: Icon(icon, color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      errorStyle: const TextStyle(color: Colors.orangeAccent),
    );
  }
}
