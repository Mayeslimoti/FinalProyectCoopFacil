class Request {
  final int solicitudId;
  final int customerId;
  final String proposito;
  final double tasaInteres;
  final int plazo;
  final double monto;
  final DateTime fechaCreacion;
  final DateTime fechaPrestamo;
  final bool estado;

  Request({
    required this.solicitudId,
    required this.customerId,
    required this.proposito,
    required this.tasaInteres,
    required this.plazo,
    required this.monto,
    required this.fechaCreacion,
    required this.fechaPrestamo,
    required this.estado,
  });

  Map<String, dynamic> toJson() {
    return {
      'solicitudId': solicitudId,
      'customerId': customerId,
      'proposito': proposito,
      'tasaInteres': tasaInteres,
      'plazo': plazo,
      'monto': monto,
      'fechaCreacion': fechaCreacion.toIso8601String(),
      'fechaPrestamo': fechaPrestamo.toIso8601String(),
      'estado': estado,
    };
  }
}
