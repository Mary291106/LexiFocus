import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  Future<void> cerrarSesion() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("Sesión cerrada correctamente");
    } catch (e) {
      print("Error al cerrar sesión: $e");
    }
  }

  Future<void> eliminarCuenta() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        print("Cuenta eliminada");
      }
    } catch (e) {
      print("Error al eliminar cuenta: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil de Usuario"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: user == null
            ? const Center(child: Text("No hay usuario autenticado"))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Correo: ${user.email ?? 'Sin correo'}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "UID: ${user.uid}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: cerrarSesion,
                    icon: const Icon(Icons.logout),
                    label: const Text("Cerrar Sesión"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: eliminarCuenta,
                    icon: const Icon(Icons.delete),
                    label: const Text("Eliminar Cuenta"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
