// SESIÓN 09 - Ejercicio 4: Clasificador de tres categorías (600 y 840)
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: EtiquetaDeCategoria())),
    ));

class EtiquetaDeCategoria extends StatelessWidget {
  const EtiquetaDeCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double ancho = constraints.maxWidth;
        String categoria;
        Color colorDeFondo;
        if (ancho < 600) {
          categoria = 'Compacta';
          colorDeFondo = Colors.orange.shade100;
        } else if (ancho < 840) {
          categoria = 'Media';
          colorDeFondo = Colors.yellow.shade100;
        } else {
          categoria = 'Expandida';
          colorDeFondo = Colors.green.shade100;
        }
        return Container(
          color: colorDeFondo,
          padding: const EdgeInsets.all(8),
          child: Text(
            'Categoría: $categoria (${ancho.toStringAsFixed(0)} pt)',
          ),
        );
      },
    );
  }
}
