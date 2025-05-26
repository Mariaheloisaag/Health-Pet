import 'package:flutter/material.dart';

class ConfirmadoScreen extends StatelessWidget {
  final String petshop;
  final String servico;
  final DateTime data;
  final TimeOfDay horario;

  ConfirmadoScreen({
    required this.petshop,
    required this.servico,
    required this.data,
    required this.horario,
  });

  @override
  Widget build(BuildContext context) {
    String dataFormatada = "${data.day}/${data.month}/${data.year}";
    String horarioFormatado = horario.format(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamento Confirmado'),
        backgroundColor: Colors.green[200],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
              const SizedBox(height: 20),
              const Text(
                'Serviço agendado com sucesso!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text("Petshop: $petshop"),
              Text("Serviço: $servico"),
              Text("Data: $dataFormatada"),
              Text("Horário: $horarioFormatado"),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Voltar ao início'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
