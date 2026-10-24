// SESIÓN 05 - Ejercicio 1: Padding uniforme sobre un texto
// Autor: ____________ (apellido_nombre)
// Verifica con el Flutter Inspector que el texto ya no toca los bordes.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Text('Ejercicio 1'),
        ),
      ),
    ));
