// SESIÓN 06 - Ejercicio 1: Predecir el tamaño
// Autor: ____________ (apellido_nombre)
//
// ANTES de ejecutar, escribe tu predicción aquí:
//   MI PREDICCIÓN: ______________________________________________
//
// Verifica ejecutando. Respuesta de referencia (compárala con la tuya):
//   Center le da a su hijo restricciones "sueltas" (loose). El Container rojo
//   pide 200x200 y lo obtiene. Pero ese Container aplica restricciones TIGHT
//   (200x200) a su hijo, así que el Container verde ignora su 400x50 y
//   se ve forzado a medir 200x200: se ve una caja VERDE de 200x200 y el rojo
//   queda totalmente cubierto.
//   Regla: "constraints go down, sizes go up" -> el hijo debe respetar las
//   restricciones que le da el padre.
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Container(color: Colors.green, width: 400, height: 50),
              ),
            ),
          ),
        ),
      ),
    ));
