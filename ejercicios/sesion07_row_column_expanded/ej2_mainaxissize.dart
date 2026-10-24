// SESIÓN 07 - Ejercicio 2: mainAxisSize min vs. max
// Autor: ____________ (apellido_nombre)
//
// COMENTARIO: con MainAxisSize.max el Row ocupa TODO el ancho disponible, por
// eso el color del Container se extiende de lado a lado. Con MainAxisSize.min
// el Row se ajusta al ancho de sus hijos y el color solo cubre ese espacio.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio2(),
    ));

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  Widget _caja(MainAxisSize size) {
    return Container(
      color: Colors.teal.shade100,
      child: Row(
        mainAxisSize: size,
        children: const [Text('Hola'), SizedBox(width: 8), Text('Mundo')],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('MainAxisSize.max (por defecto)'),
            _caja(MainAxisSize.max),
            const SizedBox(height: 16),
            const Text('MainAxisSize.min'),
            _caja(MainAxisSize.min),
          ],
        ),
      ),
    );
  }
}
