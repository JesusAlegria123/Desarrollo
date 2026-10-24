// SESIÓN 03 - Ejercicio guiado 3: Herencia (Empleados de una empresa)
// Autor: ____________ (apellido_nombre)

class Empleado {
  String nombre;
  double sueldoBase;

  Empleado(this.nombre, this.sueldoBase);

  double calcularSueldoMensual() {
    return sueldoBase;
  }

  void mostrarResumen() {
    print('$nombre gana S/. ${calcularSueldoMensual()} al mes.');
  }
}

class Vendedor extends Empleado {
  double comisionPorVenta;
  int ventasDelMes;

  Vendedor(String nombre, double sueldoBase, this.comisionPorVenta,
      this.ventasDelMes)
      : super(nombre, sueldoBase);

  @override
  double calcularSueldoMensual() {
    double sueldoBaseHeredado = super.calcularSueldoMensual();
    return sueldoBaseHeredado + (comisionPorVenta * ventasDelMes);
  }
}

void main() {
  var empleado = Empleado('Renzo', 1500);
  var vendedor = Vendedor('Ariana', 1200, 25.0, 30);

  empleado.mostrarResumen(); // Renzo gana S/. 1500.0 al mes.
  vendedor.mostrarResumen(); // Ariana gana S/. 1950.0 al mes.
}
