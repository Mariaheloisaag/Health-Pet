import 'package:flutter/material.dart';

class AgendarVisitaPage extends StatefulWidget {
  @override
  _AgendarVisitaPageState createState() => _AgendarVisitaPageState();
}

class _AgendarVisitaPageState extends State<AgendarVisitaPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA6D8A8), // verde claro
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Agendar Visita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Escolha a data e horário para conhecer Max'),
            SizedBox(height: 30),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'dd/mm/aaaa',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                    _dateController.text =
                        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
                  });
                }
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _timeController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: '--:--',
                suffixIcon: Icon(Icons.access_time),
              ),
              onTap: () async {
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    selectedTime = time;
                    _timeController.text = time.format(context);
                  });
                }
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Ação ao confirmar
              },
              child: Text('Confirmar Agendamento'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4CAF50), // verde mais escuro
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/logo.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        selectedItemColor: Colors.green,
        backgroundColor: Color(0xFFA6D8A8),
        onTap: (index) {
          // Lógica para navegação entre telas
        },
      ),
    );
  }
}
