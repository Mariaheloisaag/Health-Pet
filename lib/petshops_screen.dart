import 'package:flutter/material.dart';
import 'servicos_screen.dart'; // Próxima tela que será criada

class PetshopsScreen extends StatelessWidget {
  final List<Map<String, String>> petshops = [
    {
      'nome': 'Amigo Pet',
      'imagem': 'assets/amigo_pet.png',
      'local': '8km de distância'
    },
    {
      'nome': 'Pet Love',
      'imagem': 'assets/pet_love.png',
      'local': '12km de distância'
    },
  ];

PetshopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banho'),
        backgroundColor: Colors.green[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: petshops.length,
        itemBuilder: (context, index) {
          final petshop = petshops[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.asset(petshop['imagem']!, height: 120),
                  const SizedBox(height: 10),
                  Text(
                    petshop['nome']!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(petshop['local']!),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicosScreen(petshopNome: petshop['nome']!),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("Ver Serviços"),
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}