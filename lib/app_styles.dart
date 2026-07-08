import 'package:flutter/material.dart';

class AppStyles {
  // Estilo para títulos principales
  static const tituloPrincipal = TextStyle(
    fontFamily: 'italic',
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Estilo para subtítulos
  static const subtitulo = TextStyle(
    fontFamily: 'OpenDyslexic', // Fuente común en sistemas
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  // Estilo para texto general
  static const textoGeneral = TextStyle(
    fontFamily: 'OpenDyslexic', // Fuente clásica
    fontSize: 14,
    color: Colors.black54,
  );

  // Estilo para botones
  static const boton = TextStyle(
    fontFamily: 'OpenDyslexic', // Monoespaciada
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Estilo para etiquetas pequeñas
  static const etiqueta = TextStyle(
    fontFamily: 'OpenDyslexic',
    fontSize: 12,
    fontStyle: FontStyle.italic,
    color: Colors.grey,
  );
}
