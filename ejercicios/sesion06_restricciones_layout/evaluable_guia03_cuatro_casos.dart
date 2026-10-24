// SESIÓN 06 - EVALUABLE (Guía de Aplicación 03): Casos prácticos de errores
// de layout. 4 fichas de diagnóstico. Entrega: este .dart + capturas
// antes/después + informe (puedes escribir las fichas en los comentarios).
// Autor: ____________ (apellido_nombre)
//
// USO: cada caso tiene un interruptor 'corregido'. Ejecuta con false para ver
// el error en la consola (cópialo en la ficha) y con true para la corrección.
// NOTA: ejecuta UN caso a la vez cambiando 'casoActual' (1..4) para que los
// errores no se mezclen en la consola.
//
// FICHA (rellena una por caso):
//  1. Mensaje de error exacto:
//  2. Explicación (constraints go down, sizes go up, parent sets position):
//  3. Clasificación (overflow por contenido / restricciones no acotadas):
//  4. Corrección elegida y por qué es mejor que las alternativas:
//  5. Verificación en Flutter Inspector (constraints / size):
import 'package:flutter/material.dart';

const int casoActual = 1; // 1..4
const bool corregido = false; // false = con error, true = corregido

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: _Selector())),
    ));

class _Selector extends StatelessWidget {
  const _Selector();

  @override
  Widget build(BuildContext context) {
    switch (casoActual) {
      case 1:
        return const Caso1HorizontalOverflow();
      case 2:
        return const Caso2VerticalOverflow();
      case 3:
        return const Caso3RestriccionesInfinitas();
      default:
        return const Caso4ExpandedEnScroll();
    }
  }
}

// CASO 1: overflow horizontal (Row con Text largo)
// Causa: el Text no tiene tope de ancho. Solución: Expanded + ellipsis.
class Caso1HorizontalOverflow extends StatelessWidget {
  const Caso1HorizontalOverflow({super.key});
  @override
  Widget build(BuildContext context) {
    const t = 'Texto muy largo que no cabe en el ancho disponible del Row padre';
    return Row(children: [
      const Icon(Icons.warning),
      corregido
          ? const Expanded(child: Text(t, overflow: TextOverflow.ellipsis))
          : const Text(t),
    ]);
  }
}

// CASO 2: overflow vertical (Column más alta que su contenedor)
// Causa: la altura de los hijos (6 x 60) supera el SizedBox de 200.
// Solución: SingleChildScrollView (o reducir/reorganizar contenido).
class Caso2VerticalOverflow extends StatelessWidget {
  const Caso2VerticalOverflow({super.key});
  @override
  Widget build(BuildContext context) {
    final hijos = [
      for (var i = 1; i <= 6; i++)
        Container(
          height: 60,
          margin: const EdgeInsets.all(2),
          color: Colors.primaries[i],
          alignment: Alignment.center,
          child: Text('Bloque $i'),
        ),
    ];
    return SizedBox(
      height: 200,
      child: corregido
          ? SingleChildScrollView(child: Column(children: hijos))
          : Column(children: hijos),
    );
  }
}

// CASO 3: restricciones infinitas (ListView dentro de Column)
// Causa: Column da altura sin límite al ListView (que quiere ocupar todo).
// Solución: Expanded alrededor del ListView.
class Caso3RestriccionesInfinitas extends StatelessWidget {
  const Caso3RestriccionesInfinitas({super.key});
  @override
  Widget build(BuildContext context) {
    final lista = ListView(
      children: [for (var i = 0; i < 20; i++) ListTile(title: Text('Item $i'))],
    );
    return Column(children: [
      const Text('Encabezado'),
      corregido ? Expanded(child: lista) : lista,
    ]);
  }
}

// CASO 4: Expanded dentro de un Row con scroll horizontal (ancho ilimitado)
// Causa: Expanded necesita ancho acotado; el scroll horizontal lo da infinito.
// Solución: sacar el Expanded y dar ancho explícito con SizedBox.
class Caso4ExpandedEnScroll extends StatelessWidget {
  const Caso4ExpandedEnScroll({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const Icon(Icons.star),
        corregido
            ? const SizedBox(width: 300, child: Text('Texto con ancho fijo'))
            : const Expanded(child: Text('Texto con Expanded (error)')),
      ]),
    );
  }
}
