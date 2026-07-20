import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';

class pageRelacion extends StatelessWidget {
  const pageRelacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio de Relación", style: AppStyles.subtitulo),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE9CD),
      ),
      body: const ejerciciorelacion(),
    );
  }
}

class ejerciciorelacion extends StatelessWidget {
  const ejerciciorelacion({super.key});

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
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/mascotaO.png", height: 200),
                const SizedBox(height: 24.0),
                Text('Ejercicio de Relación', style: AppStyles.subtitulo),
                const SizedBox(height: 16.0),
                Text(
                  'Aquí va el contenido del ejercicio de relación.',
                  style: AppStyles.textoGeneral,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
