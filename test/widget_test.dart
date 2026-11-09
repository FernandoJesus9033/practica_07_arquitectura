import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:practica_07_arquitectura/providers/contador_provider.dart';
import 'package:practica_07_arquitectura/screens/home_page.dart';

void main() {
  testWidgets('La app de arquitectura carga correctamente', (
    WidgetTester tester,
  ) async {
    // 1. Inicializar intl para el test
    await initializeDateFormatting('es', null);

    // 2. Cargar la app con el Provider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ContadorProvider(),
        child: const MaterialApp(home: HomePage()),
      ),
    );

    // 3. Esperar a que el Future simulado cargue las tareas
    await tester.pumpAndSettle();

    // 4. Verificar que los elementos principales están en pantalla
    expect(find.text('Práctica 07 - Arquitectura'), findsOneWidget);
    expect(find.text('Incrementar'), findsOneWidget);
    expect(find.text('Estudiar Flutter'), findsOneWidget);
  });
}
