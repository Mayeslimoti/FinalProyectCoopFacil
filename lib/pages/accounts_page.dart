// pages/accounts_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import '../models/account.dart';
import '../const/constants.dart';

class AccountsPage extends StatelessWidget {
  final String token; // Recibimos el token desde el menú

  // Constructor recibe el token
  const AccountsPage({super.key, required this.token});

  Future<List<Account>> fetchAccounts() async {
    final response = await http.get(
      Uri.parse(
          '${Constants.apiBaseUrl}/Cuenta/GetAllAccounts'), // Endpoint de la API
      headers: {
        'Authorization':
            'Bearer $token', // Usamos el token recibido como parámetro
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Cuentas')),
      body: FutureBuilder<List<Account>>(
        future: fetchAccounts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay cuentas disponibles.'));
          } else {
            final accounts = snapshot.data!;
            return ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        account.cuentaId.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      'Saldo: \$${account.saldo.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Fecha Creación: ${account.fechaCreacion.split("T")[0]}\n'
                      'Fecha Préstamo: ${account.fechaPrestamo.split("T")[0]}\n'
                      'Estado: ${account.estado ? "Activa" : "Inactiva"}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
