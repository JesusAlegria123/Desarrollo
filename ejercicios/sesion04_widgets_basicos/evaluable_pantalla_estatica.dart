// SESIÓN 04 - EVALUABLE: Pantalla estática simple (replicar un diseño dado)
// Archivo de entrega sugerido: sesion_apellido_nombre.dart
// Autor: ____________ (apellido_nombre)
//
// REQUISITOS (checklist):
// [x] Solo Text, Container, Image, Icon (+ Row/Column/SizedBox de apoyo)
// [x] Al menos 2 Container con distinto propósito (tarjeta y chip)
// [x] Al menos una imagen con fit adecuado (BoxFit.cover)
// [x] Al menos un ícono con sentido semántico
// [x] Constantes para colores repetidos y comentarios breves
//
// >>> Ajusta tamaños/colores/textos para que coincidan con el DISEÑO que te
// >>> entregue el docente, y usa tus datos reales.
import 'package:flutter/material.dart';

// Constantes de estilo (evitan "valores mágicos")
const Color kColorPrimario = Color(0xFF7A1F2B); // guinda institucional
const Color kColorFondo = Color(0xFFF2F2F2);
const double kRadioTarjeta = 16;

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaPerfil(),
    ));

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorFondo,
      body: Center(
        // Container 1: tarjeta contenedora
        child: Container(
          width: 300,
          color: Colors.white, // OJO: sin decoration para poder usar color
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Imagen de portada con fit cover
              Image.network(
                'https://picsum.photos/300/140',
                width: 300,
                height: 140,
                fit: BoxFit.cover,
              ),
              const Text(
                'Tu Nombre Apellido',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Estudiante de Ingeniería Informática y de Sistemas',
                style: TextStyle(fontSize: 13, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              // Container 2: chip con ícono con significado (ciclo académico)
              Container(
                decoration: BoxDecoration(
                  color: kColorPrimario,
                  borderRadius: BorderRadius.circular(kRadioTarjeta),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school, size: 16, color: Colors.white),
                    SizedBox(width: 6),
                    Text('VII Ciclo', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // Nota: aquí la pantalla queda "cruda" a propósito (sin padding
              // ni margin). Se resuelve en la Sesión 05.
            ],
          ),
        ),
      ),
    );
  }
}
