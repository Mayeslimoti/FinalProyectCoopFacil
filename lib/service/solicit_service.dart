// services/solicit_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/solicit.dart';

class RequestService {
  final String baseUrl = "http://leonelh2024-001-site1.ntempurl.com";

  // Método que acepta el token para agregarlo a la cabecera
  Future<List<Request>> fetchRequests(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Solicitud/GetAllSolit'),
      headers: {
        'Authorization': 'Bearer $token', // Se incluye el token en la cabecera
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Request.fromJson(json)).toList();
    } else {
      throw Exception("Error al procesar la solicitud");
    }
  }
}
