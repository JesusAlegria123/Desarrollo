// SESIÓN 02 - Ejercicio guiado 3: Control de flujo (Clasificador de tareas)
// Autor: ____________ (apellido_nombre)

void main() {
  List<String> tareas = [
    'Instalar Flutter SDK',
    'Configurar VS Code',
    'Aprender variables en Dart',
    'Practicar funciones',
    'Repasar control de flujo',
  ];

  int contadorTareas = 0;

  for (var tarea in tareas) {
    contadorTareas++;

    if (tarea.contains('Flutter') || tarea.contains('VS Code')) {
      print('[$contadorTareas] $tarea -> Categoría: Entorno');
    } else {
      print('[$contadorTareas] $tarea -> Categoría: Aprendizaje');
    }
  }

  print('Total de tareas registradas: $contadorTareas');
}
