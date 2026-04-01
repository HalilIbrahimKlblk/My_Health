import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8080/my-health/v1";

  Future<bool> saveUser({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    final String url = "$baseUrl/user/save";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "surname": surname,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ignore: avoid_print
        print("API Yanıtı: Kayıt Başarılı. ${response.body}");
        return true;
      } else {
        // ignore: avoid_print
        print("API Hatası: Sunucu ${response.statusCode} kodu döndürdü.");
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print("API Bağlantı Hatası (Catch): $e");
      return false;
    }
  }

  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    final String url = "$baseUrl/user/login";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      // Backend'in başarılı girişte 200 OK döndüğünü varsayıyoruz
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print("API Yanıtı: Giriş Başarılı. ${response.body}");
        return true;
      } else {
        // ignore: avoid_print
        print("API Hatası: Sunucu ${response.statusCode} kodu döndürdü.");
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print("API Bağlantı Hatası (Catch): $e");
      return false;
    }
  }
}
