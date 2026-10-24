// SESIÓN 07 - Ejercicio 5: Corregir un overflow con Expanded
// Autor: ____________ (apellido_nombre)
// Se aplica Expanded al Text (el elemento de ancho variable), sin quitar
// ningún widget.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Icon(Icons.shopping_bag),
              Expanded(
                child: Text(
                  'Pedido #48291 - Confirmado y en camino a tu domicilio',
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    ));
