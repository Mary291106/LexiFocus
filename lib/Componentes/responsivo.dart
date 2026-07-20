import 'package:flutter/material.dart';

//clase para manejar lo responsivo en diferentes tamaños de pantalla
class Responsivo {
  final BoxConstraints constraints;
  final MediaQueryData mediaQuery;

  Responsivo({required this.constraints, required this.mediaQuery});

  bool get isMobile => constraints.maxWidth < 600;
  bool get isTablet =>
      constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
  bool get isDesktop => constraints.maxWidth >= 1200;

  T getValue<T>({required T mobile, required T tablet, required T desktop}) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }
}
