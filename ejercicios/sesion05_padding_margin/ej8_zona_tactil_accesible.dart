// SESIÓN 05 - Ejercicio 8: Zona táctil accesible (48x48 dp)
// Autor: ____________ (apellido_nombre)
// Cálculo: ícono de 20 px -> padding por lado = (48 - 20) / 2 = 14
// Verifica con el Flutter Inspector: GestureDetector size = 48x48.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio8(),
    ));

class Ejercicio8 extends StatelessWidget {
  const Ejercicio8({super.key});

  @override
  Widget build(BuildContext context) {
    const double tamanoIcono = 20;
    const double zonaMinima = 48;
    const double relleno = (zonaMinima - tamanoIcono) / 2; // 14

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(relleno), // 20 + 14*2 = 48
            child: Icon(Icons.favorite_border, size: tamanoIcono),
          ),
        ),
      ),
    );
  }
}
