import 'package:flutter/material.dart';
import '../models/simulation.dart';
import '../service/simulation_service.dart';

class SimulacionSolicitudPage extends StatefulWidget {
  final String token;

  const SimulacionSolicitudPage({super.key, required this.token});

  @override
  _SimulacionSolicitudPageState createState() =>
      _SimulacionSolicitudPageState();
}

class _SimulacionSolicitudPageState extends State<SimulacionSolicitudPage> {
  final TextEditingController customerIdController = TextEditingController();
  final TextEditingController propositoController = TextEditingController();
  final TextEditingController tasaInteresController = TextEditingController();
  final TextEditingController plazoController = TextEditingController();
  final TextEditingController montoController = TextEditingController();
  DateTime? fechaPrestamo;
  bool estado = true;

  Future<void> _submitSolicitud() async {
    final request = Request(
      solicitudId: 0,
      customerId: int.tryParse(customerIdController.text) ?? 0,
      proposito: propositoController.text,
      tasaInteres: double.tryParse(tasaInteresController.text) ?? 0.0,
      plazo: int.tryParse(plazoController.text) ?? 0,
      monto: double.tryParse(montoController.text) ?? 0.0,
      fechaCreacion: DateTime.now(),
      fechaPrestamo: fechaPrestamo ?? DateTime.now(),
      estado: estado,
    );

    final success = await ApiService.enviarSolicitud(request, widget.token);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Solicitud enviada con éxito.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al enviar la solicitud.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simular Solicitud'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: customerIdController,
                decoration: const InputDecoration(labelText: 'ID del Cliente'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: propositoController,
                decoration: const InputDecoration(labelText: 'Propósito'),
              ),
              TextField(
                controller: tasaInteresController,
                decoration: const InputDecoration(labelText: 'Tasa de Interés'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: plazoController,
                decoration: const InputDecoration(labelText: 'Plazo (meses)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: montoController,
                decoration: const InputDecoration(labelText: 'Monto'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      fechaPrestamo = selectedDate;
                    });
                  }
                },
                child: const Text('Seleccionar Fecha de Préstamo'),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Estado Activo'),
                value: estado,
                onChanged: (value) {
                  setState(() {
                    estado = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitSolicitud,
                child: const Text('Enviar Solicitud'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
