class Tarea {
  final int id;
  final String titulo;
  final bool completada;

  Tarea({required this.id, required this.titulo, this.completada = false});

  Tarea copyWith({bool? completada}) {
    return Tarea(
      id: id,
      titulo: titulo,
      completada: completada ?? this.completada,
    );
  }
}
