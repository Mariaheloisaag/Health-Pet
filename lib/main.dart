  import 'package:flutter/material.dart';
  import 'package:flutter_base_page/marcarconsultas_screen.dart';
  import 'consultas_screen.dart';
  import 'marcarconsultas_screen.dart';

  void main() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarcarconsultasScreen(),
    ));
  }

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // AppBar personalizada
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: const Color(0xFFB2E898),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.green[900]),
              onPressed: () {},
            ),
            centerTitle: true,
            title: Image.asset(
              'assets/logo.png',
              height: 90,
            ),
          ),
        ),

        // Corpo da tela
        body: Container(
          color: Colors.white,
          child: const Center(child: Text('')),
        ),

        // BottomNavigationBar com logo central flutuante
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          children: [
            BottomNavigationBar(  
              backgroundColor: const Color(0xFFB2E898),
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
                  icon: SizedBox.shrink(), // espaço vazio
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.share),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),

            // Logo central decorativa (não clicável)
            Positioned(
              bottom: 8,
              child: Image.asset(
                'assets/logo.png',
                height: 50,
              ),
            ),
          ],
        ),
      );
    }
  }
