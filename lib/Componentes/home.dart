import 'package:flutter/material.dart';
import 'package:mi_app/app_styles.dart';

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
        return Center(child: Text("Pantalla de Perfil"));
      default:
        return Container();
    }
  }
}

class NivelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NivelCard("Nivel 1", "assets/mascota.png", false),
        NivelCard("Nivel 2", "assets/mascota.png", true),
        NivelCard("Nivel 3", "assets/mascota.png", true),
      ],
    );
  }
}

class NivelCard extends StatelessWidget {
  final String titulo;
  final String imagen;
  final bool bloqueado;

  NivelCard(this.titulo, this.imagen, this.bloqueado);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFC081),
              ),
              child: Image.asset(imagen),
            ),
            if (bloqueado) Icon(Icons.lock, size: 40, color: Colors.black54),
          ],
        ),
        SizedBox(height: 8),
        Text(titulo, style: AppStyles.subtitulo),
      ],
    );
  }
}
