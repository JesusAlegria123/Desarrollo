// SESIÓN 06 - Ejercicio 7: Refactorizar tu pantalla (prevenir overflow)
// Autor: ____________ (apellido_nombre)
// Sustituye este mock por TU pantalla de la Sesión 4-5 y aplica lo mismo.
//
// Puntos frágiles protegidos (aunque con datos cortos no fallen):
//  1) Nombre largo en la cabecera -> Expanded + ellipsis
//  2) Biografía extensa -> maxLines + ellipsis
//  3) Fila de contacto con correo largo -> Expanded + ellipsis
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: PerfilProtegido())),
    ));

class PerfilProtegido extends StatelessWidget {
  const PerfilProtegido({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              CircleAvatar(radius: 32, child: Icon(Icons.person)),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Nombre Apellido Muy Largo De Prueba Para Verificar El Overflow',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Biografía extensa de prueba. ' 
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
            'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.email, size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'correo.muy.largo.de.prueba.para.overflow@unsaac.edu.pe',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
