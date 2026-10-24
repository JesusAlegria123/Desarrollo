// SESIÓN 07 - Ejercicio 3: Expanded con flex 1, 2 y 3
// Autor: ____________ (apellido_nombre)
// Verifica: el 2.º mide el doble del 1.º y el 3.º el triple.
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.red)),
                Expanded(flex: 2, child: Container(color: Colors.green)),
                Expanded(flex: 3, child: Container(color: Colors.blue)),
              ],
            ),
          ),
        ),
      ),
    ));
