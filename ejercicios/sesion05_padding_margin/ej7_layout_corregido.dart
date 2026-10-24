// SESIÓN 05 - Ejercicio 7: Corrección de layout "pegado"
// Autor: ____________ (apellido_nombre)
//
// Código original (SIN espaciado):
//   Column(children: [
//     Icon(Icons.person, size: 48),
//     Text('Nombre del estudiante'),
//     Container(color: Colors.blue, child: Text('IF616AIN - Desarrollo de Software II')),
//   ])
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Ejercicio7())),
    ));

class Ejercicio7 extends StatelessWidget {
  const Ejercicio7({super.key});

  @override
  Widget build(BuildContext context) {
    // Padding externo único + SizedBox entre hijos + padding en el Container
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Icon(Icons.person, size: 48),
          const SizedBox(height: 12),
          const Text('Nombre del estudiante'),
          const SizedBox(height: 12),
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: const Text(
              'IF616AIN - Desarrollo de Software II',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
