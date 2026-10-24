// SESIÓN 06 - Ejercicio 4: Diagnosticar restricciones infinitas
// Autor: ____________ (apellido_nombre)
// Cambia 'aplicarCorreccion' a false para ver el error en la consola.
//
// DIAGNÓSTICO: un ListView horizontal da ancho ILIMITADO a sus hijos; el
// ListView interno (vertical) intenta ocupar toda la altura disponible y,
// además, su hijo recibe restricciones no acotadas -> "unbounded" error.
// CORRECCIÓN MÁS SIMPLE: no anidar listas del mismo eje innecesariamente;
// usar un Column para 3 textos, o dar tamaño explícito (SizedBox) a la interna.
import 'package:flutter/material.dart';

const bool aplicarCorreccion = true;

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Ejercicio4())),
    ));

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    if (!aplicarCorreccion) {
      return ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ListView(
            children: const [Text('A'), Text('B'), Text('C')], // <- error
          ),
        ],
      );
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        SizedBox(
          width: 120,
          height: 120,
          child: Column(children: [Text('A'), Text('B'), Text('C')]),
        ),
      ],
    );
  }
}
