import 'package:flutter/material.dart';
import 'visita_agendada_page.dart'; // importa a tela da visita agendada
import 'agendamento_confirmado_page.dart'; // importa a nova tela
import 'visita_cancelada_page.dart';
import 'agendar_visita_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgendarVisitaPage(), // mantém a tela original
    );
  }
}
