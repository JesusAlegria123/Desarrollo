# Ejercicios individuales - Desarrollo de Software II (IF616AIN) - UNSAAC

Un archivo `.dart` por ejercicio, separado por sesión.
Cada archivo trae el enunciado resumido como comentario, el código y, en los
evaluables, un checklist de requisitos.

| Carpeta | Contenido | Tipo |
|---|---|---|
| `sesion02_dart_basico` | 4 ejercicios + evaluable (gestor de tareas) | Dart puro |
| `sesion03_poo_dart` | 5 ejercicios + evaluable (entidades del dominio) | Dart puro |
| `sesion04_widgets_basicos` | 5 ejercicios + evaluable (pantalla estática) | Flutter |
| `sesion05_padding_margin` | 8 ejercicios + evaluable (perfil con espaciado) | Flutter |
| `sesion06_restricciones_layout` | 7 ejercicios + evaluable (Guía 03, 4 casos) | Flutter |
| `sesion07_row_column_expanded` | 7 ejercicios + evaluable (Guía 04, estructura de perfil) | Flutter |
| `sesion08_stack_wrap` | 7 ejercicios + evaluable (perfil con superpuestos) | Flutter |
| `sesion09_layoutbuilder_mediaquery` | 5 ejercicios + evaluable (panel de diagnóstico) | Flutter |
| `integradores_cap11` | 5 ejercicios integradores (nivel intermedio) | Flutter |

## Cómo ejecutarlos
- **Dart puro (sesiones 02 y 03):** pega el archivo en https://dartpad.dev o usa `dart run archivo.dart`.
- **Flutter (sesiones 04 en adelante):** cada archivo tiene su propio `main()`.
  1. `flutter create ejercicios`
  2. Copia las carpetas dentro de `ejercicios/lib/`
  3. `flutter run -t lib/sesion04_widgets_basicos/ej1_texto_estilo.dart`
  (También funcionan en DartPad, modo Flutter.)
- Los ejercicios con imágenes usan `picsum.photos` y necesitan internet.

## Para entregar
- Escribe tu nombre en el comentario `Autor:` de cada archivo.
- Para renombrar todo de una vez: `dart run renombrar_entrega.dart apellido nombre`
  (crea `entrega_final/` con nombres como `sesion05_ej1_padding_uniforme_apellido_nombre.dart`).
- Los archivos `evaluable_*` son los que se suben al aula virtual; adapta los datos a TU proyecto
  (tu pantalla de perfil, tus tareas, tus entidades).
- Las capturas de pantalla antes/después, tablas e informes que piden algunas sesiones
  debes hacerlas tú tras ejecutar el código.

## Importante
Estos archivos no se pudieron compilar en el entorno donde se generaron: si algún
`flutter run` muestra un error, revisa la versión de Flutter (se asume Dart 3 / Flutter 3.10+).
Revisa y entiende cada solución antes de entregarla; en los ejercicios de análisis
(sesión 06) hay respuestas de referencia: intenta primero la tuya.
