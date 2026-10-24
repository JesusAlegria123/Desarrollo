// SESIÓN 05 - EVALUABLE: Completar la pantalla estática con estilos básicos
// Archivo de entrega sugerido: sesion_apellido_nombre.dart
// Entregable: este .dart + captura ANTES/DESPUÉS.
// Autor: ____________ (apellido_nombre)
//
// REQUISITOS (checklist):
// [x] 1. Padding interno en los bloques relevantes
// [x] 2. Margin entre bloques (separación clara y consistente)
// [x] 3. EdgeInsets más adecuado + comentario que lo justifica
// [x] 4. Al menos 2 fragmentos extraídos a métodos privados
// [x] 5. Íconos tocables con zona táctil mínima 48x48 dp
// [x] 6. Verificar con Flutter Inspector o debugPaintSizeEnabled (sin overflow)
//
// >>> Reemplaza los datos y la imagen por los de TU pantalla de la Sesión 04.
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart'; // para debugPaintSizeEnabled

void main() {
  // debugPaintSizeEnabled = true; // SOLO durante desarrollo
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PantallaPerfil(),
  ));
}

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  // Método 1: fila de contacto reutilizable (ícono tocable de 48x48)
  Widget _buildFilaContacto(IconData icono, String texto) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            // all: el ícono necesita espacio uniforme: 24 + 12*2 = 48 dp
            padding: const EdgeInsets.all(12),
            child: Icon(icono, size: 24, color: Colors.grey[700]),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(child: Text(texto, overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  // Método 2: etiqueta (chip) reutilizable
  Widget _buildEtiqueta(IconData icono, String texto) {
    return Container(
      // symmetric: el espaciado horizontal es mayor que el vertical
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 16, color: Colors.blue),
          const SizedBox(width: 6),
          Text(texto, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // margin: separa la tarjeta de los bordes de la pantalla
            // symmetric: valores distintos en horizontal y vertical
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            // padding: espacio interno uniforme -> all
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://picsum.photos/120'),
                ),
                const SizedBox(height: 12),
                const Text('Ana Quispe Huamán',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4), // elementos muy relacionados
                const Text(
                    'Estudiante de Ingeniería Informática y de Sistemas'),
                const SizedBox(height: 8),
                _buildEtiqueta(Icons.school, 'VII Ciclo'),
                const SizedBox(height: 16), // bloque de información distinto
                _buildFilaContacto(Icons.email, 'ana.quispe@unsaac.edu.pe'),
                _buildFilaContacto(Icons.phone, '+51 984 000 000'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
