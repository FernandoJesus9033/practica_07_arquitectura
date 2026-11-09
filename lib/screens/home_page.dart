import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/contador_provider.dart';
import '../models/tarea.dart';
import '../services/tarea_service.dart';
import '../widgets/tarea_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TareaService _service = TareaService();
  late Future<List<Tarea>> _futuroTareas;
  final String _fechaHoy = DateFormat(
    'EEEE, d MMMM y',
    'es',
  ).format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _futuroTareas = _service.obtenerTareas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 07 - Arquitectura'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 1. Uso del paquete INTL para mostrar la fecha
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hoy es: $_fechaHoy',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),

          // 2. Uso del PROVIDER con Consumer
          Consumer<ContadorProvider>(
            builder: (context, contador, child) {
              return Card(
                margin: const EdgeInsets.all(16),
                color: Colors.purple[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Contador: ${contador.valor}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilledButton.icon(
                            onPressed: contador.incrementar,
                            icon: const Icon(Icons.add),
                            label: const Text('Incrementar'),
                          ),
                          const SizedBox(width: 10),
                          OutlinedButton.icon(
                            onPressed: contador.resetear,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const Divider(),

          // 3. Uso del FutureBuilder y el Widget Reutilizable
          Expanded(
            child: FutureBuilder<List<Tarea>>(
              future: _futuroTareas,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final tareas = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: tareas.length,
                  itemBuilder: (_, i) {
                    final tarea = tareas[i];
                    return TareaCard(
                      tarea: tarea,
                      onToggle: () {
                        setState(() {
                          tareas[i] = tarea.copyWith(
                            completada: !tarea.completada,
                          );
                        });
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
