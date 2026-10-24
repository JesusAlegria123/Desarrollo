// SESIÓN 08 - Ejercicio 5: Nube de etiquetas con Wrap
// Autor: ____________ (apellido_nombre)
// Reduce el ancho de la ventana/emulador: las etiquetas pasan a más líneas
// sin overflow.
import 'package:flutter/material.dart';

const List<String> cursos = [
  'Desarrollo de Software II',
  'Bases de Datos',
  'Redes',
  'Inteligencia Artificial',
  'Sistemas Operativos',
  'Ingeniería de Software',
  'Cálculo',
  'Flutter',
  'Dart',
];

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: NubeEtiquetas())),
    ));

class NubeEtiquetas extends StatelessWidget {
  const NubeEtiquetas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final c in cursos)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(c),
            ),
        ],
      ),
    );
  }
}
