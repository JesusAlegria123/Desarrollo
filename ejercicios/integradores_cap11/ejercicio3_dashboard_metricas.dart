// CAP. 11 - Ejercicio 3: Tablero de métricas (dashboard)
// Entrega sugerida: ejercicio3_apellido_nombre.dart + 1 captura por breakpoint
// (menor y mayor a 400). Autor: ____________ (apellido_nombre)
//
// COMENTARIO (SingleChildScrollView): dentro de un scroll la altura es NO
// ACOTADA (infinita). Un Expanded dentro de la Column del scroll intentaría
// repartir un espacio vertical infinito y lanza error de restricciones. Si se
// necesita altura, se da explícita con SizedBox(height: ...).
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    ));

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Widget _kpi(IconData icono, String valor, String etiqueta) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icono, color: Colors.indigo),
            Text(valor,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            Text(etiqueta,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // Cuatro KPIs: en una fila (>=400) o de dos en dos (<400)
  Widget _filaKpis(double ancho) {
    final items = [
      _kpi(Icons.people, '1,240', 'Usuarios'),
      _kpi(Icons.shopping_cart, '86', 'Pedidos'),
      _kpi(Icons.attach_money, '9.4k', 'Ingresos'),
      _kpi(Icons.star, '4.8', 'Valoración'),
    ];
    if (ancho < 400) {
      return Column(
        children: [
          Row(children: [Expanded(child: items[0]), const SizedBox(width: 8), Expanded(child: items[1])]),
          Row(children: [Expanded(child: items[2]), const SizedBox(width: 8), Expanded(child: items[3])]),
        ],
      );
    }
    return Row(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          Expanded(child: items[i]), // flex: 1 por defecto
          if (i < items.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }

  Widget _accesosRapidos() {
    const accesos = [
      (Icons.home, 'Inicio'),
      (Icons.bar_chart, 'Reportes'),
      (Icons.inventory, 'Inventario'),
      (Icons.people, 'Clientes'),
      (Icons.settings, 'Ajustes'),
      (Icons.help, 'Ayuda'),
    ];
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final a in accesos)
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(a.$1), Text(a.$2)],
            ),
          ),
      ],
    );
  }

  Widget _alerta(String texto) {
    return Card(
      color: Colors.amber.shade50,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber, color: Colors.orange),
            const SizedBox(width: 8),
            Text(texto),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de control')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tarjeta principal con insignia "actualizado" (Stack)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text('Resumen del mes',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    Positioned(
                      top: -8,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('actualizado',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _filaKpis(constraints.maxWidth),
                const SizedBox(height: 16),
                const Text('Accesos rápidos',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                _accesosRapidos(),
                const SizedBox(height: 16),
                const Text('Alertas',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _alerta('Stock bajo en 3 productos'),
                    _alerta('2 pagos pendientes'),
                    _alerta('Actualización disponible'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
