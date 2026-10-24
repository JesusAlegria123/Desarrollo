// SESIÓN 02 - EVALUABLE: Gestor simple de lista de tareas por consola
// Archivo de entrega sugerido: sesion_apellido_nombre.dart
// Autor: ____________ (apellido_nombre)
//
// REQUISITOS (checklist):
// [x] List<String> con al menos 5 tareas (ADAPTA los nombres a tu proyecto)
// [x] List<bool> paralela con el estado de cada tarea
// [x] int contarPendientes(List<bool> estados) con bucle
// [x] String etiquetarTarea({required String titulo, required bool completada})
// [x] main(): bucle for con índice sobre ambas listas
// [x] Resumen final con contarPendientes()

// Cuenta cuántas tareas siguen pendientes (estado == false).
int contarPendientes(List<bool> estados) {
  int pendientes = 0;
  for (var completada in estados) {
    if (!completada) {
      pendientes++;
    }
  }
  return pendientes;
}

// Devuelve '[OK] título' o '[PENDIENTE] título' según el estado.
String etiquetarTarea({required String titulo, required bool completada}) {
  if (completada) {
    return '[OK] $titulo';
  } else {
    return '[PENDIENTE] $titulo';
  }
}

void main() {
  // Tareas del proyecto "Hola Mundo móvil" (cámbialas por las tuyas)
  List<String> tareas = [
    'Instalar Flutter SDK',
    'Diseñar mockup en Figma',
    'Definir entidades del dominio',
    'Configurar repositorio en GitHub',
    'Escribir primeras pruebas unitarias',
  ];

  // Estado paralelo: true = completada, false = pendiente
  List<bool> estados = [true, false, false, true, false];

  // Recorrido en paralelo con índice
  for (int i = 0; i < tareas.length; i++) {
    print(etiquetarTarea(titulo: tareas[i], completada: estados[i]));
  }

  // Resumen final
  print('');
  print('Resumen: ${tareas.length} tareas registradas, '
      '${contarPendientes(estados)} pendientes.');
}
