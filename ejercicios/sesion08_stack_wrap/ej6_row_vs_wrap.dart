// SESIÓN 08 - Ejercicio 6: Row vs. Wrap con el mismo contenido
// Autor: ____________ (apellido_nombre)
// Cambia 'usarWrap' a false: la versión con Row produce
// "A RenderFlex overflowed by X pixels on the right" (toma captura).
//
// POR QUÉ: Row no hace salto de línea; da a sus hijos ancho sin tope en el eje
// principal y, si suman más que el ancho disponible, hay overflow. Wrap
// sí salta de línea cuando no caben.
import 'package:flutter/material.dart';

const bool usarWrap = true;

const List<String> etiquetas = [
  'Desarrollo de Software II',
  'Bases de Datos',
  'Redes de Computadoras',
  'Inteligencia Artificial',
  'Sistemas Operativos',
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: usarWrap
                ? Wrap(spacing: 8, runSpacing: 8, children: _chips())
                : Row(children: _chips()),
          ),
        ),
      ),
    ));

List<Widget> _chips() => [
      for (final e in etiquetas)
        Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(e),
        ),
    ];
