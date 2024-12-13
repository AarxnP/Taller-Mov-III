import 'package:flutter/material.dart';
import 'package:pelicula_01/screens/detalles.dart';

class CatalogoPeliculasScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> categorias = {
  'Populares': [
    {
      'titulo': 'Inside Out 2',
      'descripcion': 'Riley, ahora adolescente, enfrenta nuevas emociones como la ansiedad.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 2
      'trailer': 'https://drive.google.com/uc?export=download&id=1kUbkTBiCnF4kvVPVALv9glFuvt43UoG_', // Trailer 1
    },
    {
      'titulo': 'Kung Fu Panda 4',
      'descripcion': 'Po busca un sucesor mientras enfrenta a la malvada Camaleona.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 3
      'trailer': 'https://drive.google.com/uc?export=download&id=1o5Tyt53BfjIkHxlxIHYFFy0vnJUquEpp', // Trailer 2
    },
    {
      'titulo': 'Godzilla y Kong: El Nuevo Imperio',
      'descripcion': 'Los titanes se enfrentan a una nueva amenaza que podría destruir el planeta.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 4
      'trailer': 'https://drive.google.com/uc?export=download&id=1ZsrFQoGQH2uIxUJD7MUyqWqmYmKkD557',
 // Trailer 3
    },
  ],
  'Tendencias': [
    {
      'titulo': 'Rebel Moon: Parte 2',
      'descripcion': 'Zack Snyder regresa con la segunda parte de esta épica espacial.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 5
      'trailer': 'https://drive.google.com/uc?export=download&id=1R14grP_Iju-OUfzLnrcWzkFUAVQbbvOt',
 // Trailer 4
    },
    {
      'titulo': 'Furiosa',
      'descripcion': 'La precuela del universo de Mad Max con Anya Taylor-Joy.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 6
      'trailer': 'https://drive.google.com/uc?export=download&id=1MzWWY-iIPC2q4sinq-nGpr1NJSAQymxV',
 // Trailer 5
    },
    {
      'titulo': 'Kingdom of the Planet of the Apes',
      'descripcion': 'La historia épica de unión entre humanos y simios continúa.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 7
      'trailer': 'https://drive.google.com/uc?export=download&id=1cvLiVE_d0lGAM7auZf5biuAtQ9pvZdsI',
 // Trailer 6
    },
  ],
  'Nuevas Llegadas': [
    {
      'titulo': 'Mickey 17',
      'descripcion': 'Robert Pattinson protagoniza esta intrigante historia de ciencia ficción.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 8
      'trailer': 'https://drive.google.com/uc?export=download&id=1goU9Z4dxuXJSKz3fsJ59ZylNl2ctJY3p',
 // Trailer 7
    },
    {
      'titulo': 'Amigos Imaginarios',
      'descripcion': 'Una comedia dramática dirigida por John Krasinski.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 9
      'trailer': 'https://drive.google.com/uc?export=download&id=1xBOiWbT3JqUv3XuBtSmQEowzImDKRwcM',
 // Trailer 8
    },
    {
      'titulo': 'Profesión Peligro',
      'descripcion': 'Ryan Gosling en una aventura como doble de riesgo.',
      'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // Imagen 2
      'trailer': 'https://drive.google.com/uc?export=download&id=1Xv4uBquwrfrqRoqhRK66bCvoyBO726ki', // Trailer 9
    },
  ],
};


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Películas'),
        backgroundColor: Colors.black, // Fondo oscuro
        titleTextStyle: TextStyle(color: Colors.white), // Texto blanco
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: categorias.entries.map((entry) {
          final categoria = entry.key;
          final peliculas = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  categoria,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 8, 8), // Color blanco
                  ),
                ),
              ),
              SizedBox(
                height: 280, // Altura del contenedor para las películas
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: peliculas.length,
                  itemBuilder: (context, index) {
                    final pelicula = peliculas[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetallesPeliculaScreen(
      titulo: pelicula['titulo']!,
      descripcion: pelicula['descripcion']!,
      videoUrl: pelicula['trailer']!, // Pasamos el enlace del trailer
    ),
  ),
);

                      },
                      child: Container(
                        width: 180,
                        margin: const EdgeInsets.only(right: 12),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 10, // Sombra más fuerte
                          color: Colors.grey[900], // Fondo oscuro en las tarjetas
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Hero(
                                  tag: pelicula['titulo']!,
                                  child: Image.network(
                                    pelicula['imagen']!,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  pelicula['titulo']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Título blanco
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  pelicula['descripcion']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70, // Texto blanco suave
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}