import 'package:flutter/material.dart';
import 'confirmado_screen.dart';

class AgendarBanhoScreen extends StatefulWidget {
  final String petshopNome;
  final String servicoNome;
  final double preco;

  const AgendarBanhoScreen({super.key, 
    required this.petshopNome,
    required this.servicoNome,
    required this.preco,
  });

  @override
  _AgendarBanhoScreenState createState() => _AgendarBanhoScreenState();
}

class _AgendarBanhoScreenState extends State<AgendarBanhoScreen> {
  DateTime? _dataSelecionada;
  TimeOfDay? _horarioSelecionado;

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (data != null) {
      setState(() {
        _dataSelecionada = data;
      });
    }
  }

  Future<void> _selecionarHorario(BuildContext context) async {
    final TimeOfDay? horario = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 0),
    );
    if (horario != null) {
      setState(() {
        _horarioSelecionado = horario;
      });
    }
  }

  void _confirmarAgendamento() {
    if (_dataSelecionada != null && _horarioSelecionado != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmadoScreen(
            petshop: widget.petshopNome,
            servico: widget.servicoNome,
            data: _dataSelecionada!,
            horario: _horarioSelecionado!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, selecione data e horário.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar Banho'),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Petshop: ${widget.petshopNome}', style: const TextStyle(fontSize: 16)),
            Text('Serviço: ${widget.servicoNome}', style: const TextStyle(fontSize: 16)),
            Text('Preço: R\$ ${widget.preco.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selecionarData(context),
              child: Text(_dataSelecionada == null
                  ? 'Selecionar Data'
                  : 'Data: ${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selecionarHorario(context),
              child: Text(_horarioSelecionado == null
                  ? 'Selecionar Horário'
                  : 'Horário: ${_horarioSelecionado!.format(context)}'),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _confirmarAgendamento,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Confirmar Agendamento"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
