import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

// Aplicación principal
class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Perfil Académico Interactivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const PerfilAcademico(),
    );
  }
}

// Pantalla principal
class PerfilAcademico extends StatefulWidget {
  const PerfilAcademico({super.key});

  @override
  State createState() => _PerfilAcademicoState();
}

class _PerfilAcademicoState extends State {

  // Variables solicitadas en el trabajo
  String nombre = 'Yordany Choquemamani';
  int numeroPersonal = 9;
  double promedio = 15.5;
  bool matriculado = true;

  // El contador comienza exactamente en el NP
  int logros = 9;

  @override
  Widget build(BuildContext context) {

    // Comprobar si el NP es par o impar
    String mensajeParImpar;

    if (numeroPersonal % 2 == 0) {
      mensajeParImpar = 'Tu número personal es par';
    } else {
      mensajeParImpar = 'Tu número personal es impar';
    }

    // Comprobar si el NP es alto o bajo
    String mensajeNivel;

    if (numeroPersonal > 50) {
      mensajeNivel = 'Número personal alto';
    } else {
      mensajeNivel = 'Número personal bajo';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$nombre - Versión 2'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Título de la aplicación
            const Text(
              'Mi Perfil Académico Interactivo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            // Datos académicos
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Mis datos académicos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Nombre: $nombre',
                      style: const TextStyle(fontSize: 17),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Número Personal (NP): $numeroPersonal',
                      style: const TextStyle(fontSize: 17),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Promedio ponderado: $promedio',
                      style: const TextStyle(fontSize: 17),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '¿Estoy matriculado?: ${matriculado ? "Sí" : "No"}',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Clasificación del NP
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Clasificación de mi NP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      mensajeParImpar,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      mensajeNivel,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Primeros 5 múltiplos del NP
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Primeros 5 múltiplos de mi NP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Bucle for
                    for (int i = 1; i <= 5; i++)
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('$i'),
                        ),
                        title: Text(
                          '\(numeroPersonal ×\)i = ${numeroPersonal * i}',
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Logros académicos
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [

                    const Text(
                      'Logros académicos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '$logros',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          logros++;
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Sumar logro'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Información final
            const Text(
              'Aplicaciones Móviles - Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Número Personal: 9',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}