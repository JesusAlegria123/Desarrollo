// CAP. 11 - Ejercicio 5: Pantalla de registro (solo interfaz)
// Entrega sugerida: ejercicio5_apellido_nombre.dart + 2 capturas (móvil y ancha)
// Autor: ____________ (apellido_nombre)
//
// Interfaz estática: el manejo de estados y eventos se abordará en la
// siguiente unidad.
import 'package:flutter/material.dart';

const double kGap = 16;

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaRegistro(),
    ));

class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key});

  Widget _campo(String etiqueta, IconData icono, {bool oculto = false}) {
    return TextField(
      obscureText: oculto,
      decoration: InputDecoration(
        labelText: etiqueta,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icono),
        contentPadding: const EdgeInsets.all(kGap),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(kGap),
            child: Center(
              // Ancho máximo de 480 en pantallas anchas
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _campo('Nombre completo', Icons.person),
                    const SizedBox(height: kGap),
                    _campo('Correo', Icons.email),
                    const SizedBox(height: kGap),
                    _campo('Contraseña', Icons.lock, oculto: true),
                    const SizedBox(height: kGap),
                    _campo('Teléfono', Icons.phone),
                    const SizedBox(height: kGap),
                    DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Carrera profesional'),
                      value: null,
                      items: const [
                        DropdownMenuItem(
                            value: 'sistemas',
                            child: Text('Ingeniería Informática y de Sistemas')),
                        DropdownMenuItem(
                            value: 'civil', child: Text('Ingeniería Civil')),
                        DropdownMenuItem(
                            value: 'electrica',
                            child: Text('Ingeniería Eléctrica')),
                        DropdownMenuItem(
                            value: 'mecanica',
                            child: Text('Ingeniería Mecánica')),
                      ],
                      onChanged: null, // estático
                    ),
                    const SizedBox(height: kGap),
                    const Text('Nivel de experiencia'),
                    Slider(
                      value: 2,
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: null, // estático
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Básico'), Text('Avanzado')],
                    ),
                    const SizedBox(height: kGap),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Expanded(
                            child: Text('Acepto los términos y condiciones')),
                      ],
                    ),
                    const SizedBox(height: kGap),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {}, child: const Text('Cancelar')),
                        ),
                        const SizedBox(width: kGap),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('Registrar')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
