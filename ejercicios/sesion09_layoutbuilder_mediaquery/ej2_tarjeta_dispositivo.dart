// SESIÓN 09 - Ejercicio 2: Leer el tamaño de pantalla con MediaQuery
// Autor: ____________ (apellido_nombre)
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Center(child: TarjetaDeDispositivo()))),
    ));

class TarjetaDeDispositivo extends StatelessWidget {
  const TarjetaDeDispositivo({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData datos = MediaQuery.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ancho de pantalla: ${datos.size.width}'),
            Text('Alto de pantalla: ${datos.size.height}'),
            Text('Orientación: ${datos.orientation}'),
          ],
        ),
      ),
    );
  }
}
