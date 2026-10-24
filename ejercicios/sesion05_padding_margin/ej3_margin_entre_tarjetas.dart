// SESIÓN 05 - Ejercicio 3: Margin entre dos tarjetas
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio3(),
    ));

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text('Tarjeta 1')),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightGreen.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text('Tarjeta 2')),
          ),
        ],
      ),
    );
  }
}
