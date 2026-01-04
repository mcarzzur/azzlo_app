import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://127.0.0.1:8000/api"; // local

  /// Intenta logear con username y password
  /// Retorna un Map con los datos del usuario si login correcto
  /// Retorna null si login incorrecto o error
  static Future<Map<String, dynamic>?> login({
    required String username,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/login');

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "name_user": username, // coincide con Laravel
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data; // data contiene {user: {...}, token: "...."}
      } else {
        print("Credenciales incorrectas");
        return null;
      }
    } catch (e) {
      print("Error de conexión: $e");
      return null;
    }
  }
}
