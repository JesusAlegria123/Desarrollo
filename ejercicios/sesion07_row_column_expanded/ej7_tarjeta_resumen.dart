// SESIÓN 07 - Ejercicio 7: Tarjeta de resumen
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body: SafeArea(child: Padding(padding: EdgeInsets.all(16), child: TarjetaResumen())),
      ),
    ));

class TarjetaResumen extends StatelessWidget {
  const TarjetaResumen({super.key});

  Widget _dato(String etiqueta, String valor) {
    return Expanded(
      child: Column(
        children: [
          Text(valor,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(etiqueta, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Fila superior: ícono + título (Expanded para truncar si es largo)
          const Row(
            children: [
              Icon(Icons.school, color: Colors.indigo),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Resumen académico del semestre 2026-II de Ingeniería',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Fila inferior: dos Expanded con igual flex
          Row(children: [_dato('Cursos', '6'), _dato('Créditos', '22')]),
        ],
      ),
    );
  }
}
