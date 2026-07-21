import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';

class pageRimas extends StatelessWidget{
    const pageRimas({super.key});

    @override
    Widget build (BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text("Ejercicio de Rimas", style: AppStyles.subtitulo),
                centerTitle: true,
                backgroundColor: const Color(0xFFFFFFFF),
            ),
            body: const ejerciciorimas(),
        );
    }
}

class ejerciciorimas extends StatelessWidget{
    const ejerciciorimas({super.key});

    @override
    Widget build(BuildContext context){
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
                            horizontal:24.0,
                            vertical: 16.0,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                                const Text("Selecciona la palabra que rima con la imagen",
                                style: TextStyle(fontSize: 20),),

                                ElevatedButton(
                                    onPressed:() {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFFF9541),
                                        foregroundColor: const Color(0xFFFFFFFF),
                                        minimumSize: const Size(350, 20),
                                        padding: const EdgeInsets.all(16),
                                        shape: RoundedRectangleBorder(     
                                            borderRadius: BorderRadius.circular(12),
                                        ),
                                    ),
                                    child: const Text("Opción 1")
                                ),
                                SizedBox(height:20),
                                ElevatedButton(
                                    onPressed:() {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFFF9541),
                                        foregroundColor: const Color(0xFFFFFFFF),
                                        minimumSize: const Size(350, 20),
                                        padding: const EdgeInsets.all(16),
                                        shape: RoundedRectangleBorder(     
                                            borderRadius: BorderRadius.circular(12),
                                        ),
                                    ),
                                    child: const Text("Opción 2")
                                ),
                            ]
                        ),
                    ),
                ),
            ),
        );
    }
}