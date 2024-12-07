class Customer {
  final int customerId;
  final String dni;
  final String nombres;
  final String apellidos;
  final String fechaCreacion;
  final bool estado;

  Customer({
    required this.customerId,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.fechaCreacion,
    required this.estado,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customerId'],
      dni: json['dni'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      fechaCreacion: json['fechaCreacion'],
      estado: json['estado'],
    );
  }
}
