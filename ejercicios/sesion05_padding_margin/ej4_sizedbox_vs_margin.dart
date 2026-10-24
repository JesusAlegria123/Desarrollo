// SESIÓN 05 - Ejercicio 4: SizedBox vs. margin (comparación dirigida)
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Versión 1: margin en cada Container'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final icono in [Icons.home, Icons.star, Icons.person])
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(icono),
                  ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Versión 2: SizedBox entre íconos'),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home),
                SizedBox(width: 16),
                Icon(Icons.star),
                SizedBox(width: 16),
                Icon(Icons.person),
              ],
            ),
            // COMENTARIO: la versión con SizedBox es más simple porque solo
            // necesito separar hermanos de un mismo Row, sin decoración de por
            // medio (sección 2.7): crear un Container solo para tener margin
            // agrega widgets innecesarios.
          ],
        ),
      ),
    );
  }
}
