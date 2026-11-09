# Práctica 07 - Arquitectura Flutter, Componentes, Paquetes y Optimización

## 📋 Datos Generales
- **Institución:** Instituto Tecnológico Superior de Calkiní
- **Carrera:** Ingeniería en Sistemas Computacionales
- **Asignatura:** Tópicos de Programación Móvil
- **Maestra:** Ruth Betsaida Martínez Domínguez
- **Equipo:** EQ. 6
- **Semestre:** 7
- **Grupo:** A
- **Institución:** Instituto Tecnológico Superior de Calkiní
- **Carrera:** Ingeniería en Sistemas Computacionales
- **Asignatura:** Tópicos de Programación Móvil
- **Maestra:** Ruth Betsaida Martínez Domínguez
- **Equipo:** EQ. 6
- **Semestre:** 7
- **Grupo:** A

## 🎯 Objetivo
Estructurar una aplicación Flutter escalable, integrar paquetes externos y aplicar prácticas básicas de rendimiento.

## 🛠️ Requisitos
- Flutter SDK 3.47.2+
- Dart 3.13.2+
- Visual Studio Code
- Git
- Paquetes: `provider` e `intl`

## 📦 Instalación
```bash
git clone https://github.com/FernandoJesus9033/practica_07_arquitectura.git
cd practica_07_arquitectura
flutter pub get
```

## 🚀 Ejecución
```bash
flutter run
```

## ✨ Funcionalidades y Arquitectura
La aplicación está estructurada separando responsabilidades para facilitar su mantenimiento:
- **models/**: Contiene la clase `Tarea` (representa los datos).
- **services/**: `TareaService` simula la obtención de datos desde una API o base de datos.
- **providers/**: `ContadorProvider` maneja el estado del contador de forma global.
- **screens/**: `HomePage` une todos los componentes visuales.
- **widgets/**: `TareaCard` es un componente reutilizable para mostrar cada tarea.
- **Paquetes integrados**: 
  - `provider` para la gestión del estado.
  - `intl` para formatear la fecha actual en español.

## 👥 Participantes (EQ. 6)
- Fernando Jesus Colli Cach - 9033
- Luis Antonio Chan Ku - 8941
- Josué Uriel Balam Moo - 9000
- Raúl Natanael Ojeda Martín - 8975
- Emanuel Antonio Cauich Canul - 8971
```