// SESIÓN 09 - Ejercicio 3: Dos variantes según el ancho disponible
// Autor: ____________ (apellido_nombre)
// Prueba envolviéndolo en SizedBox de distintos anchos (ver main).
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(width: 200, child: BotonAdaptable()), // < 250 -> ícono
              SizedBox(width: 320, child: BotonAdaptable()), // >= 250 -> botón
            ],
          ),
        ),
      ),
    ));

class BotonAdaptable extends StatelessWidget {
  const BotonAdaptable({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 250) {
          return IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          );
        } else {
          return ElevatedButton.icon(
            icon: const Icon(Icons.favorite_border),
            label: const Text('Agregar a favoritos'),
            onPressed: () {},
          );
        }
      },
    );
  }
}
