// SESIÓN 08 - Ejercicio 2: Positioned en las cuatro esquinas
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio2(),
    ));

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  Widget _punto(Color c) => Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(color: c, shape: BoxShape.circle),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey.shade300,
          child: Stack(
            children: [
              Positioned(top: 8, left: 8, child: _punto(Colors.red)),
              Positioned(top: 8, right: 8, child: _punto(Colors.green)),
              Positioned(bottom: 8, left: 8, child: _punto(Colors.blue)),
              Positioned(bottom: 8, right: 8, child: _punto(Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
