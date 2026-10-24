// Copia todos los .dart a la carpeta 'entrega_final' con el formato:
//   <sesion>_<ejercicio>_<apellido>_<nombre>.dart
// Uso (desde esta carpeta):  dart run renombrar_entrega.dart apellido nombre
import 'dart:io';

void main(List<String> args) {
  if (args.length < 2) {
    print('Uso: dart run renombrar_entrega.dart apellido nombre');
    return;
  }
  final sufijo = '${args[0].toLowerCase()}_${args[1].toLowerCase()}';
  final sep = Platform.pathSeparator;
  final salida = Directory('${Directory.current.path}${sep}entrega_final')
    ..createSync();
  var total = 0;

  for (final e in Directory.current.listSync()) {
    if (e is! Directory) continue;
    final nombre = e.uri.pathSegments.where((s) => s.isNotEmpty).last;
    if (!(nombre.startsWith('sesion') || nombre.startsWith('integradores'))) {
      continue;
    }
    final prefijo = nombre.split('_').first; // sesion02, integradores...
    for (final f in e.listSync().whereType<File>()) {
      final base = f.uri.pathSegments.last;
      if (!base.endsWith('.dart')) continue;
      final sinExt = base.substring(0, base.length - 5);
      f.copySync('${salida.path}$sep${prefijo}_${sinExt}_$sufijo.dart');
      total++;
    }
  }
  print('Listo: $total archivos copiados en entrega_final/');
}
