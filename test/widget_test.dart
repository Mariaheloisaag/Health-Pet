import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
<<<<<<< HEAD
import 'package:flutter_base_page/main.dart'; // nome correto do seu app
=======
import 'package:flutter_base_page/login.dart';
import 'package:flutter_base_page/paginaInicial.dart';
>>>>>>> Pagina-Inicial

void main() {
  testWidgets('HomeScreen renders AppBar and BottomNavigationBar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
<<<<<<< HEAD
=======
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
>>>>>>> Pagina-Inicial

    // Verifica se a AppBar existe
    expect(find.byType(AppBar), findsOneWidget);

    // Verifica se o logo (Image.asset) está presente
    expect(find.byType(Image), findsWidgets);

    // Verifica se a BottomNavigationBar existe
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verifica os ícones da BottomNavigationBar
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
<<<<<<< HEAD
    expect(find.byType(ImageIcon), findsOneWidget); // ícone do meio (logo)
=======
    // expect(find.byType(ImageIcon), findsOneWidget); // REMOVIDO ou pode adaptar conforme a necessidade
>>>>>>> Pagina-Inicial
    expect(find.byIcon(Icons.share), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
