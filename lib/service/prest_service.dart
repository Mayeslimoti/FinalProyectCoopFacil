// services/prest_service.dart
import 'dart:convert';
import 'package:coopfacil/models/prest.dart';
import 'package:http/http.dart' as http;

class LoanService {
  final String baseUrl = "http://leonelh2024-001-site1.ntempurl.com";

  // Método que acepta el token para agregarlo a la cabecera
  Future<List<Loan>> fetchLoans(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/Prestamo/GetAllDue'),
      headers: {
        'Authorization': 'Bearer $token', // Se incluye el token en la cabecera
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Loan.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load loans");
    }
  }
}

