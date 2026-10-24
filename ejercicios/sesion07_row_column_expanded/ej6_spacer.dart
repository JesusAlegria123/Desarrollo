// SESIÓN 07 - Ejercicio 6: Spacer para distribuir contenido
// Autor: ____________ (apellido_nombre)
// Espacio 1-2 = doble que espacio 2-3  ->  Spacer(flex: 2) y Spacer(flex: 1).
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.home),
                Spacer(flex: 2),
                Icon(Icons.search),
                Spacer(flex: 1),
                Icon(Icons.person),
              ],
            ),
          ),
        ),
      ),
    ));
