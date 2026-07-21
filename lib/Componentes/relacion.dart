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
  //final Api api= Api();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                const Text('Relaciona la palabra con la imagen',
                style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9541), 
                        foregroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(150, 200),  // ancho y alto mínimo
                        padding: const EdgeInsets.all(16), // espacio interno
                        shape: RoundedRectangleBorder(     // bordes redondeados
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Palabra 1')
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF), 
                        minimumSize: const Size(150, 200),  
                        padding: const EdgeInsets.all(16), 
                        shape: RoundedRectangleBorder(     
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Imagen 1')
                    ),
                  ],
                ),
                const SizedBox(height: 20), //eespacio entre filas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9541),
                        foregroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(150, 200),  
                        padding: const EdgeInsets.all(16), 
                        shape: RoundedRectangleBorder(     
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Palabra 2')),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(150, 200),  
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(     
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Imagen 2')),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9541),
                        foregroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(150, 200),  
                        padding: const EdgeInsets.all(16), 
                        shape: RoundedRectangleBorder(     
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Palabra 3')),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFFFFF),
                        minimumSize: const Size(150, 200),  
                        padding: const EdgeInsets.all(16), 
                        shape: RoundedRectangleBorder(     
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Imagen 3')),
                  ],
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
