// SESIÓN 09 - Ejercicio 1: Leer las restricciones con LayoutBuilder
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Center(child: SensorDeAncho()))),
    ));

class SensorDeAncho extends StatelessWidget {
  const SensorDeAncho({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.blue.shade50,
          padding: const EdgeInsets.all(12),
          child: Text(
            'maxWidth disponible: ${constraints.maxWidth.toStringAsFixed(1)}',
          ),
        );
      },
    );
  }
}
