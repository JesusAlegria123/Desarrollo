// SESIÓN 03 - EVALUABLE: Modelado de entidades del dominio de tu app
// Archivo de entrega sugerido: sesion_apellido_nombre.dart
// Autor: ____________ (apellido_nombre)
//
// EJEMPLO: app de gestión de eventos universitarios.
// >>> ADAPTA los nombres y atributos a TU propia propuesta de aplicación. <<<
//
// REQUISITOS (checklist):
// [x] Al menos 2 clases de entidades reales: Evento y Asistente
// [x] Cada clase con >= 3 atributos, obligatorios vs opcionales (?)
// [x] Constructores abreviados (this.x) con parámetros nombrados required
// [x] Un constructor nombrado: Evento.virtual
// [x] Tercera clase con extends + @override + super: EventoConferencia
// [x] Cada clase con al menos un método que usa sus atributos
// [x] main(): al menos 3 objetos y llamadas a métodos

// Entidad 1. 'lugar' es opcional (puede definirse después); el resto es
// obligatorio porque un evento no tiene sentido sin nombre, fecha ni cupo.
class Evento {
  String nombre;
  DateTime fecha;
  String? lugar;
  int capacidadMaxima;

  Evento({
    required this.nombre,
    required this.fecha,
    required this.capacidadMaxima,
    this.lugar,
  });

  // Constructor nombrado: evento virtual (sin lugar físico)
  Evento.virtual({
    required String nombre,
    required DateTime fecha,
    required int capacidadMaxima,
  }) : this(
          nombre: nombre,
          fecha: fecha,
          capacidadMaxima: capacidadMaxima,
          lugar: 'Plataforma virtual',
        );

  String describir() {
    String sitio = lugar ?? 'Por confirmar';
    return '$nombre - $sitio - Cupo: $capacidadMaxima';
  }

  void mostrarInformacion() {
    print(describir());
  }
}

// Entidad 2. 'telefono' es opcional porque no todos lo registran.
class Asistente {
  String nombre;
  String codigo;
  bool confirmado;
  String? telefono;

  Asistente({
    required this.nombre,
    required this.codigo,
    this.confirmado = false,
    this.telefono,
  });

  String estado() => confirmado ? 'confirmado' : 'pendiente';

  void mostrarResumen() {
    print('$nombre ($codigo) - ${estado()} - Tel: ${telefono ?? "sin registrar"}');
  }
}

// Herencia: una conferencia es un evento con un ponente.
class EventoConferencia extends Evento {
  String ponente;

  EventoConferencia({
    required String nombre,
    required DateTime fecha,
    required int capacidadMaxima,
    required this.ponente,
    String? lugar,
  }) : super(
          nombre: nombre,
          fecha: fecha,
          capacidadMaxima: capacidadMaxima,
          lugar: lugar,
        );

  @override
  String describir() {
    return '${super.describir()} - Ponente: $ponente';
  }
}

void main() {
  var taller = Evento(
    nombre: 'Taller de Flutter',
    fecha: DateTime(2026, 11, 5),
    capacidadMaxima: 40,
    lugar: 'Aula IN304',
  );
  var webinar = Evento.virtual(
    nombre: 'Webinar de Dart',
    fecha: DateTime(2026, 11, 12),
    capacidadMaxima: 200,
  );
  var conferencia = EventoConferencia(
    nombre: 'Charla de Arquitectura Móvil',
    fecha: DateTime(2026, 11, 20),
    capacidadMaxima: 100,
    ponente: 'Ing. Quispe',
  );
  var asistente = Asistente(
    nombre: 'Ana Quispe',
    codigo: '2023102345',
    confirmado: true,
  );

  taller.mostrarInformacion();
  webinar.mostrarInformacion();
  conferencia.mostrarInformacion(); // usa describir() sobrescrito
  asistente.mostrarResumen();
}
