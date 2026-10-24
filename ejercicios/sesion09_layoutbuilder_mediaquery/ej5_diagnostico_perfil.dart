// SESIÓN 09 - Ejercicio 5: Diagnóstico combinado (MediaQuery + LayoutBuilder)
// Autor: ____________ (apellido_nombre)
// El widget está anidado en un Padding de 40 para que los anchos difieran.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(padding: EdgeInsets.all(40), child: DiagnosticoDePerfil()),
        ),
      ),
    ));

class DiagnosticoDePerfil extends StatelessWidget {
  const DiagnosticoDePerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final double anchoDePantalla = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final double anchoLocal = constraints.maxWidth;
        final bool difieren = (anchoDePantalla - anchoLocal).abs() > 1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ancho de pantalla (MediaQuery): $anchoDePantalla'),
            Text('Ancho local (LayoutBuilder): $anchoLocal'),
            if (difieren)
              const Text(
                'Este widget recibe MENOS espacio que la pantalla completa.',
                style: TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}
