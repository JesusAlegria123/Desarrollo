// SESIÓN 07 - Ejercicio 4: Expanded vs. Flexible
// Autor: ____________ (apellido_nombre)
//
// OBSERVACIÓN: Expanded (FlexFit.tight) OBLIGA al hijo a llenar el espacio que
// le toca, ignorando su width de 60. Flexible (FlexFit.loose) le PERMITE
// ocupar hasta ese espacio, pero respeta su ancho de 60 si es menor.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio4(),
    ));

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    final caja = Container(width: 60, height: 60, color: Colors.orange);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Con Expanded'),
            Container(
              color: Colors.grey.shade300,
              child: Row(children: [Expanded(child: caja)]),
            ),
            const SizedBox(height: 16),
            const Text('Con Flexible'),
            Container(
              color: Colors.grey.shade300,
              child: Row(children: [Flexible(child: caja)]),
            ),
          ],
        ),
      ),
    );
  }
}
