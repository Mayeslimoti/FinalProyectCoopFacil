import 'package:flutter/material.dart';
import '../menu/menu_page.dart';
import '../pages/login_page.dart';
import '../pages/customer_page.dart';
import '../pages/prest_page.dart';
import '../pages/accounts_page.dart';
import '../pages/solicit_page.dart';
import '../pages/simulation_page.dart';

// Importamos la clase LoginPage y MenuPage

Map<String, WidgetBuilder> appRoutes = {
  // Ruta de login, esta pantalla no necesita token, es solo para autenticarse
  '/': (context) => LoginPage(),

  // Ruta del menu, pasamos el token desde el login
  '/menu': (context) {
    final token = ModalRoute.of(context)!.settings.arguments
        as String; // Recuperamos el token
    return MenuPage(token: token); // Pasamos el token al MenuPage
  },

  // Rutas para las demás pantallas
  '/customer': (context) {
    final token = ModalRoute.of(context)!.settings.arguments
        as String; // Recuperamos el token
    return CustomerPage(
        token:
            token); // Pasamos el token a la pantalla de perfil de los clientes
  },

  '/accounts': (context) {
    final token = ModalRoute.of(context)!.settings.arguments
        as String; // Recuperamos el token
    return AccountsPage(
        token: token); // Pasamos el token a la pantalla de Cuentas
  },

  '/loans': (context) {
    final token = ModalRoute.of(context)!.settings.arguments
        as String; // Recuperamos el token
    return LoansPage(
        token: token); // Pasamos el token a la pantalla de Préstamos
  },

  '/requests': (context) {
    final token = ModalRoute.of(context)!.settings.arguments
        as String; // Recuperamos el token
    return RequestsPage(
        token: token); // Pasamos el token a la pantalla de Solicitudes
  },

  '/simulation': (context) {
    final token = ModalRoute.of(context)!.settings.arguments
        as String; // Recuperamos el token
    return SimulacionSolicitudPage(
        token: token); // Pasamos el token a la pantalla de Solicitudes
  },
};
