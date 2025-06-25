
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// nome correto do seu app
import 'package:flutter_base_page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_base_page/main.dart';

void main() {
  testWidgets('HomeScreen renders AppBar and BottomNavigationBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    // Verifica se a AppBar existe
    expect(find.byType(AppBar), findsOneWidget);

    // Verifica se o logo (Image.asset) está presente
    expect(find.byType(Image), findsWidgets);

    // Verifica se a BottomNavigationBar existe
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verifica os ícones da BottomNavigationBar
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byType(ImageIcon), findsOneWidget); // ícone do meio (logo)
    // expect(find.byType(ImageIcon), findsOneWidget); // REMOVIDO ou pode adaptar conforme a necessidade
    expect(find.byIcon(Icons.share), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

     // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
},
);}