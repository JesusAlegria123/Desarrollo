// SESIÓN 05 - Ejercicio 2: Padding asimétrico con symmetric y only
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio2(),
    ));

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Versión 1: symmetric
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: const Text('Versión symmetric'),
            ),
            const SizedBox(height: 20),
            // Versión 2: only (mismo resultado visual)
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 12,
                bottom: 12,
              ),
              child: const Text('Versión only'),
            ),
            // Ambas se ven igual: symmetric es más legible cuando hay simetría.
          ],
        ),
      ),
    );
  }
}
