import 'package:flutter/material.dart';
import 'visita_agendada_page.dart'; // importa a tela da visita agendada
import 'agendamento_confirmado_page.dart'; // importa a nova tela
import 'visita_cancelada_page.dart';
import 'agendar_visita_page.dart';

// ✅ Função main ativada

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgendarVisitaPage(), // ou qualquer tela que queira iniciar
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
      body: Container(
        color: Colors.white,
        child: const Center(child: Text('')),
      ),
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.share), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
          Positioned(
            bottom: 8,
            child: Image.asset('assets/logo.png', height: 50),
          ),
        ],
      ),
    );
  }
}