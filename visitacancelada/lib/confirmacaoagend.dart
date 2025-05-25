import 'package:flutter/material.dart';

class ConfirmacaoAgendamentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA6D8A8),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Agendamento Confirmado',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Vacina:'),
                Text('Data:'),
                Text('Local:'),
                Text('Horário:'),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Ação do botão OK
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text('OK'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Ação do botão Cancelar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text('Cancelar Agendamento'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/logo.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
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
