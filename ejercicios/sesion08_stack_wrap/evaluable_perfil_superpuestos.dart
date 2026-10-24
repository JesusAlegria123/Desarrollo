// SESIÓN 08 - EVALUABLE: Completar la UI de perfil con elementos superpuestos
// Se valora por participación en clase. Autor: ____________ (apellido_nombre)
//
// REQUISITOS (checklist):
// [x] 1. Indicador de estado sobre el avatar con Stack + Positioned
//        (con 2 propiedades de posición: bottom y right)
// [x] 2. Comentario que justifica clipBehavior
// [x] 3. Sección de contenido variable con Wrap (etiquetas de habilidades)
// [x] 4. Probar agregando/quitando elementos de la lista del Wrap
// [x] 5. Revisar con Flutter Inspector la estructura Row/Column/Expanded
import 'package:flutter/material.dart';

// Modifica esta lista (agrega/quita) para verificar que Wrap se adapta.
const List<String> habilidades = [
  'Flutter', 'Dart', 'Git', 'SQL', 'Figma', 'Firebase', 'UI/UX', 'Testing',
];

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilSuperpuesto(),
    ));

class PerfilSuperpuesto extends StatelessWidget {
  const PerfilSuperpuesto({super.key});

  Widget _avatarConEstado() {
    // clipBehavior: Clip.none -> el indicador queda en el borde del avatar y
    // sobresale unos píxeles; con el recorte por defecto (hardEdge) se
    // cortaría. Es un valor intencional, no un valor por defecto "a ciegas".
    return Stack(
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
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _avatarConEstado(),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Ana Quispe Huamán',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Habilidades',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final h in habilidades)
                    Chip(
                      label: Text(h),
                      backgroundColor: Colors.indigo.shade50,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
