import 'package:flutter/material.dart';

class AgendamentoConfirmadoPage extends StatelessWidget {
  const AgendamentoConfirmadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizada
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xFFB2E898),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                'Agendamento Confirmado',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vacina:', style: TextStyle(fontSize: 14)),
                  Text('Data:', style: TextStyle(fontSize: 14)),
                  Text('Local:', style: TextStyle(fontSize: 14)),
                  Text('Horário:', style: TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(200, 45),
                ),
                onPressed: () {
                  // ação de OK
                },
                child: const Text('OK'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(200, 45),
                ),
                onPressed: () {
                  // ação de cancelar
                },
                child: const Text('Cancelar Agendamento'),
              ),
            ],
          ),
        ),
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
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.share), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
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
