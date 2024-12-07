// models/request.dart
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

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      solicitudId: json['solicitudId'],
      customerId: json['customerId'],
      proposito: json['proposito'],
      tasaInteres: json['tasaInteres'].toDouble(),
      plazo: json['plazo'],
      monto: json['monto'].toDouble(),
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
      fechaPrestamo: DateTime.parse(json['fechaPrestamo']),
      estado: json['estado'],
    );
  }
}
