import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';
import 'login_page.dart';

void main() {
  runApp(const LexiFocusApp());
}

class LexiFocusApp extends StatelessWidget {
  const LexiFocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo naranja
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFAF6F), Color(0xFFFFDFC6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Parte blanca curveada más arriba
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WhiteClipper(),
              child: Container(
                color: Colors.white,
                height: 700, // sube la curva blanca
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Imagen del pato
                      Image.asset("assets/mascotaO.png", height: 800),

                      // Botón encima de la imagen
                      Positioned(
                        bottom: 40, // ajusta la posición vertical
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF9541),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("¡Comenzando!")),
                            );
                          },
                          child: const Text("COMENZAR", style: AppStyles.boton),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Texto centrado arriba
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: const Text(
                "LexiFocus",
                style: AppStyles.tituloPrincipal,
                /*TextStyle(
                  fontSize: 32,
                  fontFamily: 'openDyslexic',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 ClipPath para curva blanca hacia arriba
class WhiteClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 350);

    // Curva hacia arriba
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 600, // punto de control más arriba
      size.width,
      size.height - 320, // punto final
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
