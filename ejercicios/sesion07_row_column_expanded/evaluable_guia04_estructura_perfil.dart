// SESIÓN 07 - EVALUABLE (Guía de Aplicación 04): Estructura base del perfil
// Entregable: este .dart + captura de pantalla. Autor: ____________
//
// REQUISITOS (checklist):
// [x] 1. Column raíz con cabecera, cuerpo y acciones (crossAxisAlignment)
// [x] 2. Cabecera: Row con avatar fijo + bloque de texto en Expanded
//        con overflow: TextOverflow.ellipsis en el nombre
// [x] 3. Al menos 2 filas de contacto (método reutilizable)
// [x] 4. Acciones: >= 2 elementos con Expanded y flex (justificado abajo)
// [x] 5. Verificar con Flutter Inspector que no hay overflow
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilEstructura(),
    ));

class PerfilEstructura extends StatelessWidget {
  const PerfilEstructura({super.key});

  // Método reutilizable de la Sesión 5
  Widget _filaContacto(IconData icono, String texto) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(icono, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Expanded(child: Text(texto, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          // 1. Column raíz: cabecera, cuerpo, acciones
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. CABECERA: avatar de tamaño fijo + texto expandido
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage('https://picsum.photos/120'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ana Quispe Huamán',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('Ingeniería Informática y de Sistemas - VII ciclo',
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // 3. CUERPO: filas de contacto
              _filaContacto(Icons.email, 'ana.quispe@unsaac.edu.pe'),
              _filaContacto(Icons.phone, '+51 984 000 000'),
              const Spacer(),
              // 4. ACCIONES: reparto con flex 2:1
              // Justificación: el botón principal ("Contactar") recibe el doble
              // de espacio que el secundario ("Guardar") por su importancia.
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Contactar')),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Guardar')),
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
