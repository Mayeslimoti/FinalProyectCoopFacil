import 'package:flutter/material.dart';
import '../pages/accounts_page.dart';
import '../pages/prest_page.dart';
import '../pages/solicit_page.dart';
import '../pages/customer_page.dart';
import '../pages/simulation_page.dart';

class MenuPage extends StatelessWidget {
  final String token; // Recibimos el token desde el login

  const MenuPage(
      {super.key, required this.token}); // Constructor recibe el token

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Logo de la aplicación
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    AssetImage('assets/logo.png'), // Ruta de la imagen del logo
              ),
            ),
            const Text(
              'Bienvenido a CoopFácil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Opciones del menú
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMenuCard(
                    context,
                    icon: Icons.account_circle,
                    label: 'Cliente',
                    route: '/customer',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.account_balance_wallet,
                    label: 'Cuentas',
                    route: '/accounts',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.attach_money,
                    label: 'Préstamos',
                    route: '/loans',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.request_page,
                    label: 'Solicitudes',
                    route: '/requests',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.sim_card,
                    label: 'Getionar Prestamo',
                    route: '/simulation', //
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () {
        // Pasamos el token a la siguiente página
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // Enviar el token a la pantalla correspondiente
              if (route == '/profile') {
                return CustomerPage(token: token); // Página de perfil
              } else if (route == '/accounts') {
                return AccountsPage(token: token); // Página de cuentas
              } else if (route == '/loans') {
                return LoansPage(token: token); // Página de préstamos
              } else if (route == '/requests') {
                return RequestsPage(token: token); // Página de solicitudes
              } else if (route == '/simulation') {
                return SimulacionSolicitudPage(
                    token: token); // Página de simulación
              } else {
                return Scaffold(
                  appBar: AppBar(title: Text(label)),
                  body: Center(child: Text('Página de $label')),
                );
              }
            },
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blue.shade700,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
