// SESIÓN 02 - Ejercicio guiado 1: Variables y tipos de datos (Perfil de usuario)
// Autor: ____________ (apellido_nombre)
// Ejecutar en DartPad (https://dartpad.dev) o con: dart run ej1_perfil_usuario.dart

void main() {
  // Declaración de variables con tipo explícito
  String nombreUsuario = 'Micaela Quispe';
  int edad = 21;
  double promedioNotas = 15.8;
  bool esEstudianteActivo = true;

  // Interpolación de cadenas para mostrar el perfil
  print('=== Perfil del estudiante ===');
  print('Nombre: $nombreUsuario');
  print('Edad: $edad años');
  print('Promedio: $promedioNotas');
  print('¿Activo?: $esEstudianteActivo');

  // RETO ADICIONAL: variable final codigoMatricula (2 primeras letras + edad)
  final String codigoMatricula =
      nombreUsuario.substring(0, 2).toUpperCase() + edad.toString();
  print('Código de matrícula: $codigoMatricula'); // MI21
}
