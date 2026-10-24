// SESIÓN 06 - Ejercicio 5: Elegir la herramienta correcta
// Autor: ____________ (apellido_nombre)
// Ejecutar con: dart run ej5_elegir_herramienta.dart
//
// Completa/valida tus respuestas. Referencia:
void main() {
  const respuestas = {
    '1. Lista de comentarios que crece indefinidamente':
        'ListView / SingleChildScrollView: el contenido puede superar la '
            'pantalla, por lo que necesita scroll.',
    '2. Fila con ícono fijo y texto variable que debe truncarse':
        'Expanded/Flexible sobre el Text + TextOverflow.ellipsis: reparte el '
            'espacio sobrante y evita el overflow horizontal.',
    '3. Formulario de 15 campos en pantalla pequeña':
        'SingleChildScrollView: la altura excede la pantalla y se necesita '
            'desplazamiento vertical.',
    '4. Dos botones que se reparten el ancho por igual':
        'Expanded (flex 1 cada uno) dentro de un Row.',
  };
  respuestas.forEach((escenario, solucion) {
    print('$escenario\n   -> $solucion\n');
  });
}
