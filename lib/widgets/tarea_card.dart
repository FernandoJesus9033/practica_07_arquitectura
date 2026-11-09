import 'package:flutter/material.dart';

import '../models/tarea.dart';

class TareaCard extends StatelessWidget {
  final Tarea tarea;
  final VoidCallback onToggle;

  const TareaCard({super.key, required this.tarea, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Checkbox(
          value: tarea.completada,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          tarea.titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: tarea.completada ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
