import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:mi_app/Componentes/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState(); //manejo de estado para el registro de usuario
}

// Manejo de validaciones y controladores de texto para los campos de email, contraseña y usuario
class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = TextEditingController();

  //Para registrar
  Future<void> _registrarUsuario() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      final String usuario = _userController.text.trim();
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection("usuarios")
          .doc(cred.user!.uid)
          .set({"nombre": usuario, "email": email});
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFAF6F), Color(0xFFFFDFC6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),

            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.person, size: 120),
                  const Text(
                    "Registro",
                    style: AppStyles.tituloPrincipal,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Campo Email
                  TextFormField(
                    style: AppStyles.textoGeneral,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "example@gmail.com",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(fontFamily: 'verdana'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingresa tu correo";
                      }
                      if (!value.contains("@")) {
                        return "Ingresa un correo válido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Campo Contraseña
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: "Contraseña",
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(fontFamily: 'verdana'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingresa tu contraseña";
                      }
                      if (value.length < 6) {
                        return "Debe tener al menos 6 caracteres";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Campo Usuario
                  TextFormField(
                    controller: _userController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Nombre de usuario",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintStyle: AppStyles.textoGeneral,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor ingresa tu nombre de usuario";
                      }
                      if (value.length < 3) {
                        return "Debe tener al menos 3 caracteres";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Botón Acceder
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9541),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _registrarUsuario();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Registrando usuario: ${_userController.text}",
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("REGISTRARSE", style: AppStyles.boton),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
