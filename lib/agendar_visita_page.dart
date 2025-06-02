import 'package:flutter/material.dart';
import 'agendamento_confirmado_page.dart'; // importe a tela de confirmação

class AgendarVisitaPage extends StatefulWidget {
  const AgendarVisitaPage({super.key});

  @override
  State<AgendarVisitaPage> createState() => _AgendarVisitaPageState();
}

class _AgendarVisitaPageState extends State<AgendarVisitaPage> {
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xFFB2E898),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.green),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/logo.png',
            height: 90,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 4),
                  Text('Voltar'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            const Center(
              child: Column(
                children: [
                  Text(
                    'Agendar Visita',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Escolha a data e horário para conhecer Max',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            TextField(
              controller: _dataController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'dd/mm/aaaa',
                suffixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _dataController.text =
                        "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _horaController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: '--:--',
                suffixIcon: const Icon(Icons.access_time),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _horaController.text = picked.format(context);
                  });
                }
              },
            ),

            const SizedBox(height: 32),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_dataController.text.isEmpty || _horaController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Erro"),
                        content: const Text("Por favor, preencha data e horário."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.green[100],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 60),
                            const SizedBox(height: 12),
                            const Text(
                              "Agendamento confirmado!",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Data: ${_dataController.text}\nHora: ${_horaController.text}",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // fecha o dialog
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AgendamentoConfirmadoPage(
                                    data: _dataController.text,
                                    hora: _horaController.text,
                                  ),
                                ),
                              );
                            },
                            child: const Text("OK", style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Confirmar Agendamento',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
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
