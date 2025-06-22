import 'package:flutter/material.dart';
import 'package:flutter_base_page/models/consulta.dart';
import 'package:flutter_base_page/db/consultas_database.dart';

class AgendasScreen extends StatefulWidget {
  const AgendasScreen({super.key});

  @override
  State<AgendasScreen> createState() => _AgendasScreenState();
}

class _AgendasScreenState extends State<AgendasScreen> {
  List<Consulta> consultas = [];

  @override
  void initState() {
    super.initState();
    carregarConsultas();
  }

  Future<void> carregarConsultas() async {
    final dados = await ConsultasDatabase.instance.getConsultas();
    setState(() => consultas = dados);
  }

  Future<void> cancelarConsulta(int id) async {
    await ConsultasDatabase.instance.deleteConsulta(id);
    carregarConsultas();
  }

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
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Image.asset('assets/logo.png', height: 90),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Agenda de Consultas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: consultas.isEmpty
                  ? const Center(child: Text('Nenhuma consulta marcada.'))
                  : ListView.builder(
                      itemCount: consultas.length,
                      itemBuilder: (context, index) {
                        final c = consultas[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            title: Text(c.clinica),
                            subtitle: Text('${c.data} - ${c.horario}h'),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              onPressed: () => cancelarConsulta(c.id!),
                              child: const Text('Cancelar'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
