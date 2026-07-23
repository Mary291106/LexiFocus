import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';
import 'package:mi_app/Componentes/api.dart';

class PageRimas extends StatefulWidget{
    const PageRimas({Key? key}) : super(key: key);

    @override
    State<PageRimas> createState() => _PageRimasState();
}

class _PageRimasState extends State<PageRimas>{
    late Future<List<EjercicioRimas>> futureEjercicios;
    int currentIndex = 0;

    @override 
    void initState(){
        super.initState();
        futureEjercicios = Api().getEjercicios();
    }

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFAF6F), Color(0xFFFFDFC6)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                ),
                child: FutureBuilder<List<EjercicioRimas>>(
                    future: futureEjercicios,
                    builder: (context, snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting){
                            return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError){
                            return Center(child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text("No hay ejercicios disponibles"));
                        }

                        final ejercicios = snapshot.data!;
                        final ejercicio = ejercicios[currentIndex];
                        
                        return SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal:24.0 , vertical:16.0 ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    const Text("Selecciona la palabra que rima con la imagen", style: TextStyle(fontSize:20),),
                                    ElevatedButton(
                                        onPressed:(){},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFFF9541),
                                            foregroundColor: const Color(0xFFFFFFFF),
                                            minimumSize: const Size(350, 20),
                                            padding: const EdgeInsets.all(16),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                                        ),
                                        child: Text(ejercicio.opciones[0])
                                    ),
                                    const SizedBox(height:20),
                                    ElevatedButton(
                                        onPressed:(){},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFFF9541),
                                            foregroundColor: const Color(0xFFFFFFFF),
                                            minimumSize: const Size(350, 20),
                                            padding: const EdgeInsets.all(16),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                                        ),
                                        child: Text(ejercicio.opciones[1])
                                    ),
                                    const SizedBox(height:20),
                                    ElevatedButton(
                                        onPressed:(){
                                            setState((){currentIndex++;});
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFFF9541),
                                            foregroundColor: const Color(0xFFFFFFFF),
                                            minimumSize: const Size(350, 20),
                                            padding: const EdgeInsets.all(16),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                                        ),
                                        child: Text("→")
                                    ),
                                ],
                            ),
                        );
                    },
                ),
            ),
        );
    }
}