// CAP. 11 - Ejercicio 1: Tarjeta de producto de una tienda
// Entrega sugerida: ejercicio1_apellido_nombre.dart + captura
// Autor: ____________ (apellido_nombre)
// Solo StatelessWidget; callbacks vacíos. Unidad base de espaciado: 8.
import 'package:flutter/material.dart';

const double kBase = 8; // unidad base: todos los espacios son múltiplos de 8

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body: SafeArea(child: Center(child: TarjetaProducto())),
      ),
    ));

class TarjetaProducto extends StatelessWidget {
  const TarjetaProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(kBase * 2),
      padding: const EdgeInsets.all(kBase * 2),
      // decoration con color (sin usar color: a la vez)
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen con esquinas redondeadas + etiqueta de descuento (Stack)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/300/140',
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: kBase,
                right: kBase,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kBase, vertical: kBase / 2),
                  decoration: BoxDecoration(
                    color: const Color(0x99000000),
                    borderRadius: BorderRadius.circular(kBase),
                  ),
                  child: const Text('-20%',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: kBase),
          // Nombre del producto en Expanded: un nombre largo no desborda
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Audífonos inalámbricos con cancelación de ruido',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Text('Electrónica', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: kBase),
          // Precio y favorito a los extremos
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('S/ 199.90',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Icon(Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
  }
}
