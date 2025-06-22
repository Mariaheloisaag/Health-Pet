import 'package:flutter/material.dart';
import 'agendas_screen.dart';
import 'marcarconsultas_screen.dart';
import 'package:flutter_base_page/models/consulta.dart';
import 'package:flutter_base_page/db/consultas_database.dart';

class ConsultasScreen extends StatefulWidget {
  const ConsultasScreen({super.key});

  @override
  State<ConsultasScreen> createState() => _ConsultasScreenState();
}

class _ConsultasScreenState extends State<ConsultasScreen> {
  Consulta? proximaConsulta;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarProximaConsulta();
  }

  Future<void> carregarProximaConsulta() async {
    final db = ConsultasDatabase.instance;
    List<Consulta> consultas = await db.getConsultas();

    DateTime agora = DateTime.now();

    // Filtra consultas futuras (data + horário)
    List<Consulta> futuras =
        consultas.where((c) {
          DateTime dt = _parseDataHora(c.data, c.horario);
          return dt.isAfter(agora);
        }).toList();

    // Ordena pelo mais próximo
    futuras.sort((a, b) {
      DateTime dtA = _parseDataHora(a.data, a.horario);
      DateTime dtB = _parseDataHora(b.data, b.horario);
      return dtA.compareTo(dtB);
    });

    setState(() {
      proximaConsulta = futuras.isNotEmpty ? futuras.first : null;
      carregando = false;
    });
  }

  DateTime _parseDataHora(String data, String horario) {
    // Supõe data no formato dd/MM/yyyy e horário HH:mm
    final partesData = data.split('/');
    final partesHora = horario.split(':');
    return DateTime(
      int.parse(partesData[2]),
      int.parse(partesData[1]),
      int.parse(partesData[0]),
      int.parse(partesHora[0]),
      int.parse(partesHora[1]),
    );
  }

  Future<void> cancelarConsulta(int id) async {
    final db = ConsultasDatabase.instance;
    await db.deleteConsulta(id);
    await carregarProximaConsulta(); // Atualiza a tela
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
              'Consultas Veterinárias',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 36,
                  child: // No botão "Ver Agenda"
                      ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 194, 195, 194),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AgendasScreen(),
                        ),
                      ).then((_) {
                        // Atualiza ao voltar da tela de agenda
                        carregarProximaConsulta();
                      });
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.black87,
                    ),
                    label: const Text(
                      'Ver Agenda',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'Próximas Consultas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            carregando
                ? const Center(child: CircularProgressIndicator())
                : (proximaConsulta == null
                    ? const Text('Nenhuma consulta agendada.')
                    : Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(proximaConsulta!.clinica),
                        subtitle: Text(
                          '${proximaConsulta!.data} - ${proximaConsulta!.horario}h',
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            cancelarConsulta(proximaConsulta!.id!);
                          },
                          child: const Text('Cancelar'),
                        ),
                      ),
                    )),

            const SizedBox(height: 24),

            // Clínica disponível
            const Text(
              'Clínicas Disponiveis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

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
                    const SizedBox(height: 4),
                    const Text('Especialidades: Dermatologia, Ortopedia'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text('4.8 - 1,5km de você'),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const MarcarconsultasScreen(),
                              ),
                            ).then((_) {
                              // Atualiza consulta ao voltar da tela de marcação
                              carregarProximaConsulta();
                            });
                          },
                          child: const Text('Marcar Consulta'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
