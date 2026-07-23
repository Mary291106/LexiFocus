import 'dart:convert';
import 'package:http/http.dart' as http;

class EjercicioRimas {
    final String imagen;
    final String instruccion;
    final List<String> opciones;
    final String respuesta;
    final String tipo;

    EjercicioRimas({
        required this.imagen,
        required this.instruccion,
        required this.opciones,
        required this.respuesta,
        required this.tipo,
    });

    factory EjercicioRimas.fromJson(Map<String, dynamic> json) {
        List<String> opcionesList = [];
        final opcionesRaw = json['opciones'];
        
        if (opcionesRaw is List) {
            opcionesList = List<String>.from(opcionesRaw);
        } else if (opcionesRaw is Map) {
            // Si es Map, toma todos los valores como lista
            opcionesList = opcionesRaw.values.map((e) => e.toString()).toList();
        } else if (opcionesRaw is String) {
            // Si es un solo string, lo mete en una lista
            opcionesList = [opcionesRaw];
        }
        return EjercicioRimas(
            imagen: json['imagen'] ?? '',
            instruccion: json['instruccion'] ?? '',
            opciones: opcionesList,
            respuesta: json['respuesta']?.toString() ?? '',
            tipo: json['tipo'] ?? '',
        );
    }
}

class Api {
    Future<List<EjercicioRimas>> getEjercicios() async {
        final response = await http.get(
        Uri.parse("https://serene-embrace-production-137e.up.railway.app/getejercicios"),
        );

        if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List) {
            final soloRimas = data.where((e) => e['tipo'] == 'rimas').toList();
            return soloRimas.map((e) => EjercicioRimas.fromJson(e)).toList();
        } else if (data is Map && data.containsKey('data')) {
            final lista = data['data'] as List;
            final soloRimas = lista.where((e) => e['tipo'] == 'rimas').toList();
            return soloRimas.map((e) => EjercicioRimas.fromJson(e)).toList();
        } else {
            throw Exception("Formato inesperado: $data");
        }
        } else {
        throw Exception("Error al obtener ejercicios: ${response.statusCode}");
        }
    }
}

class EjercicioRelacion { 
    final String instruccion;
    final List<String> column_derech;
    final List<String> column_izq;
    final String tipo;

    EjercicioRelacion({
        required this.instruccion,
        required this.column_derech,
        required this.column_izq,
        required this.tipo,
    });

    factory EjercicioRelacion.fromJson(Map<String, dynamic> json) { 
        List<String> column_derechList = [];
        List<String> column_izqList = [];

        final column_derechRaw = json['column_derech'];
        final column_izqRaw =json['column_izq'];
        
        if (column_derechRaw is List && column_izqRaw is List) { 
            column_derechList = List<String>.from(column_derechRaw);
            column_izqList = List<String>.from(column_izqRaw);
        } else if (column_derechRaw is Map && column_izqRaw is Map) {
            // Si es Map, toma todos los valores como lista
            column_derechList = column_derechRaw.values.map((e) => e.toString()).toList();
            column_izqList = column_izqRaw.values.map((e) => e.toString()).toList();
        } else if (column_derechRaw is String && column_izqRaw is String) {
            // Si es un solo string, lo mete en una lista
            column_derechList = [column_derechRaw];
            column_izqList = [column_izqRaw];
        }
        return EjercicioRelacion(
            instruccion: json['instruccion'] ?? '',
            column_derech: column_derechList,
            column_izq: column_izqList,
            tipo: json['tipo'] ?? '',
        );
    }
}

class ApiRelacion {
    Future<List<EjercicioRelacion>> getEjerciciosRelacion() async {
        final response = await http.get(Uri.parse("https://serene-embrace-production-137e.up.railway.app/getejercicios"),);
        if (response.statusCode == 200) {
        final data = jsonDecode(response.body);  

        if (data is List) {
            final soloRelacion = data.where((e) => e['tipo'] == 'relacion').toList();
            return soloRelacion.map((e) => EjercicioRelacion.fromJson(e)).toList();
        } else if (data is Map && data.containsKey('data')) {
            final lista = data['data'] as List;
            final soloRelacion = lista.where((e) => e['tipo'] == 'relacion').toList();
            return soloRelacion.map((e) => EjercicioRelacion.fromJson(e)).toList();
        } else {
            throw Exception("Formato inesperado: $data");
        }
        } else {
        throw Exception("Error al obtener ejercicios: ${response.statusCode}");
        }
    }
}