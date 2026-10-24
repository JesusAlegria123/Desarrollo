// SESIÓN 07 - Ejercicio 1: mainAxisAlignment en acción
// Autor: ____________ (apellido_nombre)
// Muestra los seis valores a la vez.
//
// COMENTARIO (completa con tu observación):
//  spaceBetween: sin espacio en los extremos, el resto se reparte ENTRE ítems.
//  spaceAround: espacio alrededor de cada ítem (los extremos tienen la mitad).
//  spaceEvenly: el mismo espacio entre ítems y en los extremos.
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final a in MainAxisAlignment.values) ...[
              Text(a.name),
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: a,
                  children: const [
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
