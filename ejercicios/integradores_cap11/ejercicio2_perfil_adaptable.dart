// CAP. 11 - Ejercicio 2: Perfil de usuario adaptable
// Entrega sugerida: ejercicio2_apellido_nombre.dart + 2 capturas (<600 y >=600)
// Autor: ____________ (apellido_nombre)
//
// Regla de restricciones (comentario requerido): Expanded recibe restricciones
// TIGHT en el eje principal del Row: el Row calcula primero el espacio libre
// (ancho disponible - hijos fijos) y se lo reparte según flex, de modo que
// el hijo recibe ese ancho exacto (min = max). Por eso el texto largo
// no puede "empujar" fuera de la fila: debe ajustarse a ese ancho.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilAdaptable(),
    ));

class PerfilAdaptable extends StatelessWidget {
  const PerfilAdaptable({super.key});

  // Cabecera: avatar (con indicador en línea) + nombre/carrera en Expanded
  Widget _cabecera() {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage('https://picsum.photos/120'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ana Quispe Huamán',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Ingeniería Informática y de Sistemas',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }

  Widget _estadistica(String valor, String etiqueta, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(valor,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            Text(etiqueta, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Estadísticas con flex distinto: 2, 1 y 1
  Widget _estadisticas() {
    return Row(
      children: [
        _estadistica('12', 'Proyectos', 2),
        _estadistica('6', 'Cursos', 1),
        _estadistica('9', 'Logros', 1),
      ],
    );
  }

  Widget _habilidades() {
    const lista = ['Flutter', 'Dart', 'Git', 'SQL', 'Figma', 'Firebase', 'UI/UX'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [for (final h in lista) Chip(label: Text(h))],
    );
  }

  Widget _acciones() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(onPressed: () {}, child: const Text('Seguir'))),
        const SizedBox(width: 12),
        Expanded(
            child: OutlinedButton(
                onPressed: () {}, child: const Text('Mensaje'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool ancho = constraints.maxWidth >= 600;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (ancho)
                    // >= 600: cabecera y estadísticas en una Row de dos bloques
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _cabecera()),
                        const SizedBox(width: 16),
                        Expanded(child: _estadisticas()),
                      ],
                    )
                  else ...[
                    // < 600: una sola columna
                    _cabecera(),
                    const SizedBox(height: 16),
                    _estadisticas(),
                  ],
                  const SizedBox(height: 24),
                  const Text('Habilidades',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _habilidades(),
                  const SizedBox(height: 24),
                  _acciones(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
