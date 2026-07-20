//import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:mi_app/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'registro.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// manejo de validaciones y controladores de texto para los campos de email y contraseña
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Para iniciar sesión
  Future<void> _iniciarSesion() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      if (_formKey.currentState!.validate()) {
        UserCredential cred = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print("el usuario es: ${cred.user!.uid}");
      } else {
        throw Exception("Por favor ingresa tu correo y contraseña");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Construcción de la interfaz de usuario
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
                    "Login",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Campo Email con neumorfismo
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 251, 250),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "juanperez@gmail.com",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
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
                  ),
                  const SizedBox(height: 20),

                  // Campo Contraseña con neumorfismo
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Contraseña",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
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
                  ),
                  const SizedBox(height: 30),

                  // Botón Ingresar con neumorfismo
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9541),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            //color: const Color.fromARGB(255, 243, 185, 138),
                            offset: const Offset(6, 6),
                            blurRadius: 10,
                          ),
                          const BoxShadow(
                            color: Color.fromARGB(255, 245, 208, 178),
                            offset: Offset(-9, -9),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "INGRESAR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "¿No tienes una cuenta?",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(
                        width: 8,
                      ), // Espacio entre el texto y el botón
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _iniciarSesion();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Iniciando sesión con: ${_emailController.text}",
                                ),
                              ),
                            );
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistroPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Regístrate aquí",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
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
