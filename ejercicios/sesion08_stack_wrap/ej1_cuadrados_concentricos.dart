// SESIÓN 08 - Ejercicio 1: Superposición básica (cuadrados concéntricos)
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.red),
              Container(width: 150, height: 150, color: Colors.green),
              Container(width: 100, height: 100, color: Colors.blue),
            ],
          ),
        ),
      ),
    ));
