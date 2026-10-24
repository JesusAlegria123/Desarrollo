// CAP. 11 - Ejercicio 4: Galería de imágenes con superposiciones
// Entrega sugerida: ejercicio4_apellido_nombre.dart + captura + párrafo de
// fragilidad. Autor: ____________ (apellido_nombre)
//
// COMENTARIO (degradado): una foto puede tener zonas claras u oscuras al azar;
// el texto blanco directamente sobre ella no siempre se lee. El degradado
// oscuro en la parte inferior garantiza contraste suficiente siempre.
//
// ANÁLISIS DE FRAGILIDAD (completa tras probar 2 anchos):
// La sección más frágil ante el cambio de ancho es ______ porque ______.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Galeria(),
    ));

class Galeria extends StatelessWidget {
  const Galeria({super.key});

  static const categorias = [
    'Playas', 'Montañas', 'Ciudades', 'Selva', 'Museos', 'Gastronomía',
    'Aventura', 'Cultura',
  ];

  Widget _destacada() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 240,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network('https://picsum.photos/600/300', fit: BoxFit.cover),
            // Degradado oscuro sobre la imagen
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 16,
              bottom: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Machu Picchu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  Text('Cusco, Perú',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tarjetaSecundaria(int i) {
    return SizedBox(
      width: 160,
      child: Card(
        clipBehavior: Clip.none, // el ícono puede sobresalir
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    'https://picsum.photos/200/120?random=$i',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Destino secundario número $i con nombre largo',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 4,
              right: 4,
              child: Icon(Icons.favorite_border, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _destacada(),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final c in categorias) Chip(label: Text(c))],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [for (var i = 1; i <= 6; i++) _tarjetaSecundaria(i)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
