import '../models/tarea.dart';

class TareaService {
  Future<List<Tarea>> obtenerTareas() async {
    await Future.delayed(const Duration(seconds: 1)); // Simula carga
    return [
      Tarea(id: 1, titulo: 'Estudiar Flutter'),
      Tarea(id: 2, titulo: 'Hacer la práctica 7'),
      Tarea(id: 3, titulo: 'Revisar Provider'),
    ];
  }
}
