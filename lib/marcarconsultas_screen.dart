import 'package:flutter/material.dart';
import 'agendas_screen.dart';

class MarcarconsultasScreen extends StatefulWidget {
  const MarcarconsultasScreen({super.key});

  @override
  State<MarcarconsultasScreen> createState() => _MarcarconsultasScreenState();
}

class _MarcarconsultasScreenState extends State<MarcarconsultasScreen> {
  DateTime? dataSelecionada;
  String? horarioSelecionado;

  final List<String> horariosDisponiveis = [
    '09:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xFFB2E898),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.green[900]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Image.asset('assets/logo.png', height: 90),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Marcar Consultas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Escolher data e horario',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Clínica
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Vet Saúde',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.black),
                        SizedBox(width: 4),
                        Text('Centro'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('Especialidades: Dermatologia, Ortopedia'),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),

            const Text(
              'Escolha a data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 194, 195, 194),
              ),
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: dataSelecionada ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    dataSelecionada = picked;
                  });
                }
              },
              icon: const Icon(Icons.calendar_today, color: Colors.black87),
              label: Text(
                dataSelecionada == null
                    ? 'Selecionar data'
                    : '${dataSelecionada!.day}/${dataSelecionada!.month}/${dataSelecionada!.year}',
                style: const TextStyle(color: Colors.black87),
              ),
            ),

            const SizedBox(height: 16),
            const SizedBox(height: 16),
            const Text(
              'Escolha o horário',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  horariosDisponiveis.map((horario) {
                    final bool selecionado = horario == horarioSelecionado;
                    return SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            horarioSelecionado = horario;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selecionado
                                  ? Colors.green
                                  : const Color.fromARGB(255, 194, 195, 194),
                        ),
                        child: Text(
                          horario,
                          style: TextStyle(
                            color: selecionado ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 36),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (dataSelecionada == null || horarioSelecionado == null) {
                      // Se algum dos dados não estiver selecionado, mostra aviso
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Atenção'),
                              content: const Text(
                                'Por favor, selecione data e horário.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    } else {
                      // Mostra confirmação com os dados selecionados
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Consulta marcada'),
                              content: Text(
                                'Data: ${dataSelecionada!.day}/${dataSelecionada!.month}/${dataSelecionada!.year}\n'
                                'Horário: $horarioSelecionado',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Fechar'),
                                ),
                              ],
                            ),
                      );
                    }
                  },
                  child: const Text('Confirmar Consulta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
