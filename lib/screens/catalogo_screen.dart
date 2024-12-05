import 'package:flutter/material.dart';
import 'package:pelicula_01/navegadores/drawer.dart';
import 'package:pelicula_01/screens/detalles.dart';

class CatalogoPeliculasScreen extends StatelessWidget {
  // Lista de películas (puedes modificarla o cargarla dinámicamente)
  final List<Map<String, String>> peliculas = [
    {
      'titulo': 'Película 1',
      'descripcion': 'Descripción breve de la película 1',
    },
    {
      'titulo': 'Película 2',
      'descripcion': 'Descripción breve de la película 2',
    },
    {
      'titulo': 'Película 3',
      'descripcion': 'Descripción breve de la película 3',
    },
    // Agrega más películas aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: peliculas.length, // Cantidad de elementos en la lista
        itemBuilder: (context, index) {
          final pelicula = peliculas[index];
          return Card(
            child: ListTile(
              title: Text(pelicula['titulo']!),
              subtitle: Text(pelicula['descripcion']!),
              onTap: () {
                // Navegar a la pantalla de detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallesPeliculaScreen(
                      titulo: pelicula['titulo']!,
                      descripcion: pelicula['descripcion']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
