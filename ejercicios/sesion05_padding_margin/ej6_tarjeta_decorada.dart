// SESIÓN 05 - Ejercicio 6: Tarjeta con decoración completa
// Autor: ____________ (apellido_nombre)
// Recuerda: color y decoration NO pueden coexistir en el mismo Container.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body: Center(child: TarjetaTarea()),
      ),
    ));

class TarjetaTarea extends StatelessWidget {
  const TarjetaTarea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Entregar guía de aplicación',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Vence: antes del cierre de la sesión práctica',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
