import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';
import 'package:mi_app/Componentes/relacion.dart';
import 'package:mi_app/Componentes/perfil.dart';
import 'package:mi_app/Componentes/rimas.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState(); //esto sirve para crear el estado de la pantalla de inicio
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Pantalla seleccionada (por defecto es el Home)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LexiFocus", style: AppStyles.tituloPrincipal),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE9CD),
      ),
      body: _buildBody(backgroundColor: const Color(0xFFFFE9CD)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xFFFFE9CD),
        selectedItemColor: const Color(0xFFFF9541),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Juegos"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody({required Color backgroundColor}) {
    return Container(color: backgroundColor, child: _getBody());
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return Center(child: Text("Pantalla de Juegos"));
      case 1:
        return Center(child: NivelScreen());
      case 2:
        return Center(child: const PerfilScreen());
      default:
        return Container();
    }
  }
}

class NivelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NivelCard(
          "Nivel 1",
          "assets/mascota.png",
          false,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const pageRelacion()),
          ),
        ),
        const SizedBox(height: 20),
        NivelCard(
          "Nivel 2", 
          "assets/mascota.png", false,
          onTap: ()=> Navigator.push(
            context,
          MaterialPageRoute(builder: (context)=> const pageRimas()),
          ),
        ),
        const SizedBox(height: 20),
        NivelCard("Nivel 3", "assets/mascota.png", true),
      ],
    );
  }
}

class NivelCard extends StatelessWidget {
  final String titulo;
  final String imagen;
  final bool bloqueado;
  final VoidCallback? onTap;

  NivelCard(this.titulo, this.imagen, this.bloqueado, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bloqueado ? null : onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFC081),
                ),
                child: Image.asset(imagen),
              ),
              if (bloqueado) Icon(Icons.lock, size: 60, color: Colors.black54),
            ],
          ),
          const SizedBox(width: 16), // espacio entre imagen y texto
          Text(titulo, style: AppStyles.subtitulo),
        ],
      ),
    );
  }
}
