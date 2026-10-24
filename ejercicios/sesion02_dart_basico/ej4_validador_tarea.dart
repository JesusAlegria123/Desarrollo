// SESIÓN 02 - Ejercicio guiado 4: Integración (Validador de registro de tarea)
// Autor: ____________ (apellido_nombre)

bool validarTarea({required String titulo, required int prioridad}) {
  if (titulo.isEmpty) {
    print('Error: el título no puede estar vacío.');
    return false;
  }
  if (prioridad < 1 || prioridad > 3) {
    print('Error: la prioridad debe estar entre 1 y 3.');
    return false;
  }
  return true;
}

// RETO ADICIONAL: contar cuántas tareas cumplen la validación
int contarTareasValidas(List<String> titulos, List<int> prioridades) {
  int validas = 0;
  for (int i = 0; i < titulos.length; i++) {
    if (validarTarea(titulo: titulos[i], prioridad: prioridades[i])) {
      validas++;
    }
  }
  return validas;
}

void main() {
  List<String> titulosPendientes = ['Estudiar Dart', '', 'Practicar Flutter'];
  List<int> prioridades = [2, 1, 5];

  int i = 0;
  while (i < titulosPendientes.length) {
    print('--- Validando tarea ${i + 1} ---');
    bool esValida = validarTarea(
      titulo: titulosPendientes[i],
      prioridad: prioridades[i],
    );
    print(esValida ? 'Tarea registrada con éxito.' : 'Tarea rechazada.');
    i++;
  }

  // Reto
  print('--- Reto ---');
  int total = contarTareasValidas(titulosPendientes, prioridades);
  print('Tareas válidas: $total');
}
