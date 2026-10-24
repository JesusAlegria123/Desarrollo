// SESIÓN 02 - Ejercicio guiado 2: Funciones (Calculadora de promedio)
// Autor: ____________ (apellido_nombre)

double calcularPromedio(double nota1, double nota2, double nota3) {
  double suma = nota1 + nota2 + nota3;
  double promedio = suma / 3;
  return promedio;
}

String evaluarEstado(double promedio) {
  if (promedio >= 10.5) {
    return 'Aprobado';
  } else {
    return 'Desaprobado';
  }
}

// RETO ADICIONAL: cantidad variable de notas con List<double>
double calcularPromedioLista(List<double> notas) {
  if (notas.isEmpty) return 0;
  double suma = 0;
  for (var nota in notas) {
    suma += nota;
  }
  return suma / notas.length;
}

void main() {
  double promedioFinal = calcularPromedio(14.0, 12.5, 16.0);
  String estado = evaluarEstado(promedioFinal);

  print('Promedio: $promedioFinal'); // 14.166666666666666
  print('Estado: $estado'); // Aprobado

  // Reto
  var promedioLista = calcularPromedioLista([14.0, 12.5, 16.0, 9.0]);
  print('Promedio (lista): $promedioLista');
}
