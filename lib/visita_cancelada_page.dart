import 'package:flutter/material.dart';

class VisitaCanceladaPage extends StatelessWidget {
  const VisitaCanceladaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar com a logo e o menu
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

      // Corpo da tela
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.close,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              'Visita Cancelada',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // ação ao voltar para o início
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Voltar ao Início',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      // BottomNavigationBar
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
