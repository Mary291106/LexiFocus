import 'package:flutter/material.dart';
import 'Componentes/pantalla-carga.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mi_app/Componentes/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Componentes/home.dart';
import 'Componentes/perfil.dart';
import 'Componentes/login_page.dart';
import 'Componentes/registro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const LoginPage(), // Pantalla de carga inicial
    );
  }
}
