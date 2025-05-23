import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizada
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFFB2E898), // Verde claro
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.green[900]),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/logo.png', // Coloque sua logo aqui
            height: 120,
          ),
        ),
      ),
      
      // Corpo da tela
      body: Container(
        color: Colors.white,
        child: Center(child: Text('')),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFB2E898),
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Colors.green[900],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/logo.png')), 
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share), // ou use ícone de osso personalizado
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}