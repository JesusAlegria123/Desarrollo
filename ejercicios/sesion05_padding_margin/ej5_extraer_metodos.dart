// SESIÓN 05 - Ejercicio 5: Anidamiento con extracción a método
// Autor: ____________ (apellido_nombre)
// Sustituye _buildFilaContacto / _buildEtiqueta por fragmentos de TU pantalla.
// Tras refactorizar, la pantalla debe verse exactamente igual.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: PerfilRefactorizado())),
    ));

class PerfilRefactorizado extends StatelessWidget {
  const PerfilRefactorizado({super.key});

  // Fragmento 1 (se repite): fila de ícono + texto
  Widget _buildFilaContacto(IconData icono, String texto) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(icono, size: 18, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(texto),
        ],
      ),
    );
  }

  // Fragmento 2 (tiene sentido propio): etiqueta de ciclo
  Widget _buildEtiqueta(String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(texto, style: const TextStyle(fontSize: 12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ana Quispe Huamán',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildEtiqueta('VII Ciclo'),
          const SizedBox(height: 16),
          _buildFilaContacto(Icons.email, 'ana.quispe@unsaac.edu.pe'),
          _buildFilaContacto(Icons.phone, '+51 984 000 000'),
        ],
      ),
    );
  }
}
