// SESIÓN 04 - Ejercicio 4: Fila combinando ícono y texto
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio4(),
    ));

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.blue.shade50,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.code, color: Colors.blue),
              SizedBox(width: 8),
              Text('Flutter'),
            ],
          ),
        ),
      ),
    );
  }
}
