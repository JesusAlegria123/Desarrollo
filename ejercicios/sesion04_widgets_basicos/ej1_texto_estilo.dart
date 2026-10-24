// SESIÓN 04 - Ejercicio 1: Texto con estilo personalizado
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio1(),
    ));

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Pista: textAlign solo se nota si el Text ocupa más ancho que su
        // contenido, por eso lo envolvemos en un Container con width.
        child: Container(
          width: 320,
          color: Colors.grey.shade200,
          child: const Text(
            'Tu Nombre Completo', // <- cambia por tu nombre
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}
