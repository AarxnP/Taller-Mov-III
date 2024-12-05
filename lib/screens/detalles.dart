import 'package:flutter/material.dart';

class DetallesPeliculaScreen extends StatelessWidget {
  final String titulo;
  final String descripcion;

  DetallesPeliculaScreen({required this.titulo, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para simular la reproducción de la película
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Reproduciendo "$titulo"...')),
                  );
                },
                child: Text('Reproducir Película'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
