// Conexión a API externa
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
    Future<List<Ejercicio>> getEjercicios() async { 
        final response = await http.get(Uri.parse("https://serene-embrace-production-137e.up.railway.app/getejercicios"));
        if (response.statusCode == 200) { 
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => Ejercicio.fromJson(e)).toList(); 
        } else {
        throw Exception("Error al obtener ejercicios");
        }
    }
}