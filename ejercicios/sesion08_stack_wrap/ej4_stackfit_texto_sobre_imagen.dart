// SESIÓN 08 - Ejercicio 4: StackFit.loose vs StackFit.expand
// Autor: ____________ (apellido_nombre)
//
// COMENTARIO: con StackFit.loose el Stack toma el tamaño de su hijo no
// posicionado más grande (la imagen, si tiene tamaño). Con StackFit.expand
// los hijos no posicionados se ESTIRAN al tamaño máximo del Stack (aquí
// 220x160 del SizedBox); si la imagen no tiene tamaño explícito, con expand
// llena todo el espacio y con loose usa su tamaño natural.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio4(),
    ));

class Ejercicio4 extends StatelessWidget {
  const Ejercicio4({super.key});

  Widget _tarjeta(StackFit fit) {
    return SizedBox(
      width: 220,
      height: 160,
      child: Stack(
        fit: fit,
        children: [
          Image.network('https://picsum.photos/100', fit: BoxFit.cover),
          const Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              'Texto sobre imagen',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 4)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('StackFit.loose'),
              _tarjeta(StackFit.loose),
              const SizedBox(height: 16),
              const Text('StackFit.expand'),
              _tarjeta(StackFit.expand),
            ],
          ),
        ),
      ),
    );
  }
}
