import 'package:flutter/material.dart';
import 'agendar_banho_screen.dart'; // próxima tela

class ServicosScreen extends StatelessWidget {
  final String petshopNome;

  ServicosScreen({super.key, required this.petshopNome});

  final List<Map<String, dynamic>> servicos = [
    {
      'titulo': 'Banho Simples',
      'descricao': 'Banho com shampoo neutro, secagem e escovação',
      'preco': 40.0
    },
    {
      'titulo': 'Banho Medicinal',
      'descricao': 'Banho com produtos dermatológicos específicos para problemas de pele',
      'preco': 60.0
    },
    {
      'titulo': 'Tosa Higiênica',
      'descricao': 'Corte de pelos em áreas estratégicas para higiene e conforto',
      'preco': 50.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços disponíveis em $petshopNome'),
        backgroundColor: Colors.green[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          final servico = servicos[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(servico['titulo'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(servico['descricao']),
                  const SizedBox(height: 6),
                  Text("Preço: R\$ ${servico['preco'].toStringAsFixed(2)}"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgendarBanhoScreen(
                            servicoNome: servico['titulo'],
                            preco: servico['preco'],
                            petshopNome: petshopNome,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("Agendar"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
