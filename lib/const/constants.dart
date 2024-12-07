class Constants {
  // URL base de la API
  static const String apiBaseUrl =
      'http://leonelh2024-001-site1.ntempurl.com'; // Usamos la misma URL de la API de App 1

  // Endpoints específicos
  static const String customersEndpoint = '/Customer/GetAllCustomer';
  static const String loginEndpoint = '/Security/login';
  static const String accountsEndpoint = '/Cuenta/GetAllAccounts';
  static const String loansEndpoint = '/Prestamo/GetAllDue';
  static const String requestsEndpoint = '/Solicitud/GetAllSolit';
  static const String simulationEndpoint = '/SolicitudAddSolicitud';

  // Añadimos la cabecera para el AccessToken que se utilizará en las peticiones
  static const String accessTokenHeader = 'Authorization';
}
