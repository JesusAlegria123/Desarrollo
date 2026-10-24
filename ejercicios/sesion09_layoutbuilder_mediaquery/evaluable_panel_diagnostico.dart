// SESIÓN 09 - EVALUABLE: Analizar la adaptación de la pantalla de perfil
// Autor: ____________ (apellido_nombre)
// Entregable: este .dart + tabla (Parte B) + informe (Parte C) + captura del
// panel funcionando.
//
// PARTE A: panel de diagnóstico (abajo) con: ancho de pantalla, ancho local,
//          orientación y categoría de breakpoint. Pruébalo rotando el
//          emulador o redimensionando la ventana.
// PARTE B: llena la tabla probando 3 anchos (uno por categoría):
//   | Ancho probado | Categoría | ¿Algo se desborda/corta/aprieta? | Sección afectada |
//   | 360 pt        | Compacta  |                                  |                  |
//   | 700 pt        | Media     |                                  |                  |
//   | 900 pt        | Expandida |                                  |                  |
// PARTE C: informe de 5-8 líneas: ¿qué sección es la más frágil ante cambios
//   de ancho y por qué? (usa: restricciones, breakpoint, MediaQuery,
//   LayoutBuilder). Pista: el Wrap de etiquetas.
//
// >>> Sustituye PerfilMock por TU pantalla de perfil de las Sesiones 7 y 8.
import 'package:flutter/material.dart';

const bool mostrarDiagnostico = true; // ponlo en false para ocultar el panel

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaConDiagnostico(),
    ));

class PantallaConDiagnostico extends StatelessWidget {
  const PantallaConDiagnostico({super.key});

  String _categoria(double ancho) {
    if (ancho < 600) return 'Compacta';
    if (ancho < 840) return 'Media';
    return 'Expandida';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final media = MediaQuery.of(context);
            return Column(
              children: [
                if (mostrarDiagnostico)
                  Container(
                    width: double.infinity,
                    color: const Color(0xBF000000),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Pantalla: ${media.size.width.toStringAsFixed(0)} | '
                      'Local: ${constraints.maxWidth.toStringAsFixed(0)} | '
                      '${media.orientation.name} | '
                      '${_categoria(constraints.maxWidth)}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                const Expanded(child: SingleChildScrollView(child: PerfilMock())),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Mock de la pantalla de perfil (reemplázalo por el tuyo)
class PerfilMock extends StatelessWidget {
  const PerfilMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 36, child: Icon(Icons.person)),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'Ana Quispe Huamán',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final h in ['Flutter', 'Dart', 'Git', 'SQL', 'Figma', 'UI/UX'])
                Chip(label: Text(h)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Contactar'))),
              const SizedBox(width: 12),
              Expanded(
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Guardar'))),
            ],
          ),
        ],
      ),
    );
  }
}
