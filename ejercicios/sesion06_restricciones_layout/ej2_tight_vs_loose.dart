// SESIÓN 06 - Ejercicio 2: Tight vs. loose
// Autor: ____________ (apellido_nombre)
// La app calcula isTight para cada restricción. Completa tu explicación.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio2(),
    ));

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    final casos = <String, BoxConstraints>{
      'A: 100x100 fijo': const BoxConstraints(
          minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100),
      'B: 0..300 en ambos ejes': const BoxConstraints(
          minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 300),
      'C: ancho 50 fijo, alto 0..200': const BoxConstraints(
          minWidth: 50, maxWidth: 50, minHeight: 0, maxHeight: 200),
    };

    // Respuestas de referencia (hijo que "quiere" 50x50):
    //  A) TIGHT: el hijo se ve obligado a medir 100x100 (no puede elegir).
    //  B) LOOSE: el hijo puede medir 50x50 (cabe entre 0 y 300).
    //  C) Mixta: ancho tight (50) y alto loose; el hijo mide 50x50 porque
    //     el ancho coincide y el alto 50 está dentro de 0..200.
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final e in casos.entries)
              ListTile(
                title: Text(e.key),
                subtitle: Text(
                    'isTight: ${e.value.isTight}  | tightWidth: ${e.value.hasTightWidth}  | tightHeight: ${e.value.hasTightHeight}'),
              ),
          ],
        ),
      ),
    );
  }
}
