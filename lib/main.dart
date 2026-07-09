import 'package:flutter/material.dart';
import 'Componentes/pantalla-carga.dart';
import 'Componentes/home.dart';
import 'Componentes/login_page.dart';
import 'Componentes/registro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      // Pantalla de inicio de la aplicación
      home: const LexiFocusApp(), // Pantalla de carga inicial
    );
  }
}
