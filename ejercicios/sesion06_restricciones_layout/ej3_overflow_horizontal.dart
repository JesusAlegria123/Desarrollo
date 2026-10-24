// SESIÓN 06 - Ejercicio 3: Diagnosticar un overflow horizontal
// Autor: ____________ (apellido_nombre)
// Cambia 'aplicarCorreccion' a false para ver el error en la consola.
//
// DIAGNÓSTICO: el Text dentro del Row no tiene límite de ancho: el Row le
// pasa restricciones sin tope en el eje principal, el texto pide más ancho
// del que tiene el padre y aparece "RenderFlex overflowed by X pixels".
// CORRECCIÓN: Expanded (o Flexible) sobre el Text + TextOverflow.ellipsis.
import 'package:flutter/material.dart';

const bool aplicarCorreccion = true;

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Ejercicio3())),
    ));

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    const texto = 'Precio total: S/ 1,250.00 (incluye IGV y descuentos)';
    if (!aplicarCorreccion) {
      return const Row(
        children: [
          Icon(Icons.shopping_cart, size: 32),
          Text(texto), // <- provoca overflow
        ],
      );
    }
    return const Row(
      children: [
        Icon(Icons.shopping_cart, size: 32),
        SizedBox(width: 8),
        Expanded(
          child: Text(texto, overflow: TextOverflow.ellipsis, maxLines: 2),
        ),
      ],
    );
  }
}
