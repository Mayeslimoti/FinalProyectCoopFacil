import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/customer_model.dart';
import '../const/constants.dart';

class CustomerPage extends StatefulWidget {
  final String token; // Recibimos el token desde el menú

  // Constructor recibe el token
  const CustomerPage({super.key, required this.token});

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late Future<List<Customer>> _customers;

  @override
  void initState() {
    super.initState();
    _customers =
        fetchCustomers(); // Llamamos a la función para obtener los usuarios/perfiles
  }

  // Método para obtener los clientes usando el token
  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(
      Uri.parse(
          'http://leonelh2024-001-site1.ntempurl.com/Customer/GetAllCustomer'),
      headers: {
        'Authorization': 'Bearer ${widget.token}', // Usamos el token recibido
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfiles de Usuarios'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Customer>>(
        future: _customers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No customers found'));
          } else {
            final customers = snapshot.data!;
            return ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(
                        customer.nombres[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      '${customer.nombres} ${customer.apellidos}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('DNI: ${customer.dni}'),
                    trailing: Icon(
                      customer.estado ? Icons.check_circle : Icons.cancel,
                      color: customer.estado ? Colors.green : Colors.red,
                    ),
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
