// SESIÓN 03 - Ejercicio guiado 5: Integración (Sistema de personajes)
// Autor: ____________ (apellido_nombre)

class Personaje {
  String nombre;
  int nivel;
  int puntosVida;
  String? habilidadEspecial; // no todos tienen una

  Personaje({
    required this.nombre,
    required this.nivel,
    required this.puntosVida,
    this.habilidadEspecial,
  });

  void recibirDanio(int cantidad) {
    puntosVida -= cantidad;
    if (puntosVida < 0) puntosVida = 0;
  }

  void mostrarEstado() {
    String habilidad = habilidadEspecial ?? 'Ninguna';
    print('$nombre (Nv. $nivel) - Vida: $puntosVida - Habilidad: $habilidad');
  }
}

class Mago extends Personaje {
  int puntosMana;

  Mago({
    required String nombre,
    required int nivel,
    required int puntosVida,
    required this.puntosMana,
  }) : super(
          nombre: nombre,
          nivel: nivel,
          puntosVida: puntosVida,
          habilidadEspecial: 'Bola de fuego',
        );

  void lanzarHechizo() {
    if (puntosMana >= 20) {
      puntosMana -= 20;
      print('$nombre lanza Bola de fuego. Maná restante: $puntosMana');
    } else {
      print('$nombre no tiene suficiente maná.');
    }
  }
}

// RETO: segunda subclase con armadura que reduce el daño
class Guerrero extends Personaje {
  int puntosArmadura;

  Guerrero({
    required String nombre,
    required int nivel,
    required int puntosVida,
    required this.puntosArmadura,
  }) : super(
          nombre: nombre,
          nivel: nivel,
          puntosVida: puntosVida,
          habilidadEspecial: 'Golpe poderoso',
        );

  int bloquearAtaque(int danio) {
    int danioFinal = danio - puntosArmadura;
    return danioFinal < 0 ? 0 : danioFinal;
  }

  @override
  void recibirDanio(int cantidad) {
    super.recibirDanio(bloquearAtaque(cantidad));
  }
}

void main() {
  var personaje = Personaje(nombre: 'Thalia', nivel: 5, puntosVida: 120);
  var mago = Mago(nombre: 'Yerson', nivel: 4, puntosVida: 80, puntosMana: 60);
  var guerrero =
      Guerrero(nombre: 'Bruno', nivel: 6, puntosVida: 150, puntosArmadura: 10);

  personaje.mostrarEstado();
  mago.mostrarEstado();
  mago.lanzarHechizo();
  mago.recibirDanio(15);
  mago.mostrarEstado();

  guerrero.recibirDanio(25); // recibe 15 por la armadura
  guerrero.mostrarEstado();
}
