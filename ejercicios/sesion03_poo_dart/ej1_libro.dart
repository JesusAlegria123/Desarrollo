// SESIÓN 03 - Ejercicio guiado 1: Clase simple (Libro)
// Autor: ____________ (apellido_nombre)

class Libro {
  String titulo;
  String autor;
  int anioPublicacion;

  Libro(this.titulo, this.autor, this.anioPublicacion);

  void mostrarFicha() {
    print('$titulo, de $autor ($anioPublicacion)');
  }

  // RETO: true si fue publicado en los últimos 10 años
  bool esReciente() {
    return DateTime.now().year - anioPublicacion <= 10;
  }
}

void main() {
  var libro1 = Libro('Clean Architecture', 'Robert C. Martin', 2017);
  var libro2 = Libro('Cien años de soledad', 'Gabriel García Márquez', 1967);

  libro1.mostrarFicha();
  libro2.mostrarFicha();

  print('¿Libro 1 reciente? ${libro1.esReciente()}');
  print('¿Libro 2 reciente? ${libro2.esReciente()}');
}
