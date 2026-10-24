// SESIÓN 04 - Ejercicio 3: Imagen con ajuste de tamaño (BoxFit)
// Autor: ____________ (apellido_nombre)
// Requiere internet (Image.network). 
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio3(),
    ));

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  Widget _imagen(BoxFit fit) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.grey.shade300,
        child: Image.network(
          'https://picsum.photos/300/150',
          width: 200,
          height: 200,
          fit: fit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('BoxFit.cover'),
            _imagen(BoxFit.cover),
            const SizedBox(height: 16),
            const Text('BoxFit.contain'),
            _imagen(BoxFit.contain),
            // COMENTARIO (completa con tu observación):
            // Para una foto de perfil cuadrada/circular se ve mejor BoxFit.cover
            // porque rellena todo el espacio sin dejar bordes vacíos (recorta
            // el exceso). contain deja franjas vacías si la proporción difiere.
          ],
        ),
      ),
    );
  }
}
