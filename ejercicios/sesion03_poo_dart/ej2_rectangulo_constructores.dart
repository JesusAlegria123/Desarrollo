// SESIÓN 03 - Ejercicio guiado 2: Constructores nombrados (Rectángulo)
// Autor: ____________ (apellido_nombre)

class Rectangulo {
  double base;
  double altura;

  Rectangulo(this.base, this.altura);

  // Constructor nombrado: cuadrado (caso especial de rectángulo)
  Rectangulo.cuadrado(double lado)
      : base = lado,
        altura = lado;

  // RETO: altura a partir del perímetro y la base (P = 2(b + h) => h = P/2 - b)
  Rectangulo.desdePerimetroYBase(double perimetro, double base)
      : base = base,
        altura = (perimetro / 2) - base;

  double calcularArea() => base * altura;
  double calcularPerimetro() => 2 * (base + altura);
}

void main() {
  var rect = Rectangulo(8, 4);
  var cuad = Rectangulo.cuadrado(5);
  var desdeP = Rectangulo.desdePerimetroYBase(24, 8); // altura = 4

  print('Área rectángulo: ${rect.calcularArea()}'); // 32.0
  print('Área cuadrado: ${cuad.calcularArea()}'); // 25.0
  print('Altura desde perímetro: ${desdeP.altura}'); // 4.0
  print('Perímetro desdeP: ${desdeP.calcularPerimetro()}'); // 24.0
}
