// SESIÓN 03 - Ejercicio guiado 4: Null safety en clases (Tarjeta de estudiante)
// Autor: ____________ (apellido_nombre)

class TarjetaEstudiante {
  String nombreCompleto; // obligatorio
  String codigoUniversitario; // obligatorio
  String? correoAlternativo; // opcional
  String? numeroEmergencia; // opcional

  // RETO: atributo de inicialización tardía
  late DateTime fechaEmision;

  TarjetaEstudiante({
    required this.nombreCompleto,
    required this.codigoUniversitario,
    this.correoAlternativo,
    this.numeroEmergencia,
  });

  void emitirTarjeta() {
    fechaEmision = DateTime.now();
  }

  void mostrarDatosContacto() {
    String correo = correoAlternativo ?? 'No registrado';
    String emergencia = numeroEmergencia ?? 'No registrado';
    print('Correo alternativo: $correo');
    print('Contacto de emergencia: $emergencia');
  }
}

void main() {
  var tarjeta1 = TarjetaEstudiante(
    nombreCompleto: 'Katherine Huamán',
    codigoUniversitario: '2023102345',
  );
  tarjeta1.mostrarDatosContacto();

  // Reto: acceder a fechaEmision antes de emitirTarjeta() lanza
  // LateInitializationError en tiempo de ejecución.
  try {
    print(tarjeta1.fechaEmision);
  } catch (e) {
    print('Error esperado: $e');
  }

  tarjeta1.emitirTarjeta();
  print('Fecha de emisión: ${tarjeta1.fechaEmision}');
}
