// SESIÓN 06 - Ejercicio 6: Leer un mensaje de error real
// Autor: ____________ (apellido_nombre)
//
// INSTRUCCIONES:
// 1) Ejecuta con aplicarCorreccion = false, copia el error de la consola.
// 2) Pégalo abajo y anota: tipo de RenderFlex, orientación del overflow,
//    cantidad de píxeles y archivo/línea que señala Flutter.
// 3) Ejecuta con aplicarCorreccion = true y confirma que desaparece.
//
// ERROR COPIADO:
//   (pega aquí el mensaje completo)
//
// ANÁLISIS:
//   Tipo de RenderFlex:       ______ (Row = horizontal / Column = vertical)
//   Orientación del overflow: ______
//   Píxeles desbordados:      ______
//   Archivo y línea:          ______
import 'package:flutter/material.dart';

const bool aplicarCorreccion = false; // cambia a true luego

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Caso())),
    ));

class Caso extends StatelessWidget {
  const Caso({super.key});

  @override
  Widget build(BuildContext context) {
    const largo =
        'Este es un texto bastante largo que no cabe en una sola línea del Row';
    return Row(
      children: [
        const Icon(Icons.info),
        aplicarCorreccion
            ? const Expanded(child: Text(largo))
            : const Text(largo),
      ],
    );
  }
}
