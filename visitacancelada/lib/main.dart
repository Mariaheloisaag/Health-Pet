import 'package:flutter/material.dart';

class VisitaCanceladaPage extends StatelessWidget {
  const VisitaCanceladaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA7E5A3),
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFA7E5A3),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 2,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logo.png',
              height: 30,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.close,
            size: 60,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          const Text(
            'Visita Cancelada',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Ação para voltar ao início
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Voltar ao Início',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
