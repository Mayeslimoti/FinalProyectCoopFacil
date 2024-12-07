// models/account.dart
class Account {
  final int cuentaId;
  final int customerId;
  final double saldoInicial;
  final double cuotaAporte;
  final double saldo;
  final String fechaCreacion;
  final String fechaPrestamo;
  final bool estado;

  Account({
    required this.cuentaId,
    required this.customerId,
    required this.saldoInicial,
    required this.cuotaAporte,
    required this.saldo,
    required this.fechaCreacion,
    required this.fechaPrestamo,
    required this.estado,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      cuentaId: json['cuentaId'],
      customerId: json['customerId'],
      saldoInicial: json['saldoInicial'],
      cuotaAporte: json['cuotaAporte'],
      saldo: json['saldo'],
      fechaCreacion: json['fechaCreacion'],
      fechaPrestamo: json['fechaPrestamo'],
      estado: json['estado'],
    );
  }
}
