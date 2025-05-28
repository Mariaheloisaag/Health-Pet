import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base_page/main.dart'; 

void main() {
  testWidgets('HomeScreen renders AppBar and BottomNavigationBar', (WidgetTester tester) async {
    // Renderiza apenas a HomeScreen
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verifica se a AppBar existe
    expect(find.byType(AppBar), findsOneWidget);

    // Verifica se o logo (Image.asset) está presente
    expect(find.byType(Image), findsWidgets);

    // Verifica se a BottomNavigationBar existe
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verifica os ícones da BottomNavigationBar
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.share), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
