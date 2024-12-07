import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/simulation.dart';

class ApiService {
  static const String _baseUrl = 'https://leonelh2024-001-site1.ntempurl.com';

  // Método para enviar una solicitud
  static Future<bool> enviarSolicitud(Request request, String token) async {
    final url = Uri.parse('$_baseUrl/Solicitud/AddSolicitud');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return true; // Solicitud exitosa
      } else {
        print('Error al enviar solicitud: ${response.body}');
        return false; // Error
      }
    } catch (e) {
      print('Error de red: $e');
      return false;
    }
  }
}
