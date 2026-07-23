import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';
import 'package:mi_app/Componentes/api.dart';

class PageRelacion extends StatefulWidget{
  const PageRelacion([Key? key]) : super(key: key);

  @override
  State<PageRelacion> createState() => _PageRelacion();
}

class _PageRelacion extends State<PageRelacion>{
  late Future<List<EjercicioRelacion>> futureEjerciciosRelacion; //falta cambiar esot
  int currentIndex = 0;

  @override
  void initState(){
    super.initState();
    futureEjerciciosRelacion = ApiRelacion().getEjerciciosRelacion(); 
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
        child: FutureBuilder<List<EjercicioRelacion>>(
          future: futureEjerciciosRelacion,
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError){
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty){
              return const Center(child: Text("No hay ejercicios disponibles"));
            }

            final ejerciciosRel = snapshot.data!;
            final ejercicioRel = ejerciciosRel[currentIndex];

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal:24.0 , vertical:16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  const Text("Relaciona la palabra con la imagen", style: TextStyle(fontSize:20),),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
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
                        child: Text(ejercicioRel.column_derech[0])
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
                        child: Text(ejercicioRel.column_izq[0])
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
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
                        child: Text(ejercicioRel.column_derech[1])
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
                        child: Text(ejercicioRel.column_izq[1])
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
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
                        child: Text(ejercicioRel.column_derech[2])
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
                        child: Text(ejercicioRel.column_izq[2])
                      ),
                    ],
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