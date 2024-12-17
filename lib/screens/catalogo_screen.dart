import 'package:flutter/material.dart';
import 'package:pelicula_01/screens/detalles.dart';

class CatalogoPeliculasScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> categorias = {
     'Populares': [
      {
        'titulo': 'Inside Out 2',
        'descripcion': 'Riley, ahora adolescente, enfrenta nuevas emociones como la ansiedad.',
        'imagen': 'assets/images/2.jpg',
        'trailer': 'https://drive.google.com/uc?export=download&id=1kUbkTBiCnF4kvVPVALv9glFuvt43UoG_',
      },
      {
        'titulo': 'Kung Fu Panda 4',
        'descripcion': 'Po busca un sucesor mientras enfrenta a la malvada Camaleona.',
        'imagen': 'assets/images/2.jpg',
        'trailer': 'https://drive.google.com/uc?export=download&id=1o5Tyt53BfjIkHxlxIHYFFy0vnJUquEpp',
      },
      {
        'titulo': 'Godzilla y Kong: El Nuevo Imperio',
        'descripcion': 'Los titanes se enfrentan a una nueva amenaza que podría destruir el planeta.',
        'imagen': 'assets/images/3.jpg',
        'trailer': 'https://drive.google.com/uc?export=download&id=1ZsrFQoGQH2uIxUJD7MUyqWqmYmKkD557',
      },
    ],
    'Tendencias': [
      {
        'titulo': 'Rebel Moon: Parte 2',
        'descripcion': 'Zack Snyder regresa con la segunda parte de esta épica espacial.',
        'imagen': 'assets/images/4.jpg',
        'trailer': 'https://drive.google.com/uc?export=download&id=1R14grP_Iju-OUfzLnrcWzkFUAVQbbvOt',
      },
      {
        'titulo': 'Furiosa',
        'descripcion': 'La precuela del universo de Mad Max con Anya Taylor-Joy.',
        'imagen': 'assets/images/5.jpg',
        'trailer': 'https://drive.google.com/uc?export=download&id=1MzWWY-iIPC2q4sinq-nGpr1NJSAQymxV',
      },
      {
        'titulo': 'Kingdom of the Planet of the Apes',
        'descripcion': 'La historia épica de unión entre humanos y simios continúa.',
        'imagen': 'assets/images/6.jpg',
        'trailer': 'https://drive.google.com/uc?export=download&id=1cvLiVE_d0lGAM7auZf5biuAtQ9pvZdsI',
      },
    ],
      'Nuevas Llegadas': [
    {
      'titulo': 'Mickey 17',
      'descripcion': 'Robert Pattinson protagoniza esta intrigante historia de ciencia ficción.',
      'imagen': 'assets/images/7.jpg', // Imagen 8
      'trailer': 'https://drive.google.com/uc?export=download&id=1goU9Z4dxuXJSKz3fsJ59ZylNl2ctJY3p',
 // Trailer 7
    },
    {
      'titulo': 'Amigos Imaginarios',
      'descripcion': 'Una comedia dramática dirigida por John Krasinski.',
      'imagen': 'assets/images/8.jpg', // Imagen 9
      'trailer': 'https://drive.google.com/uc?export=download&id=1xBOiWbT3JqUv3XuBtSmQEowzImDKRwcM',
 // Trailer 8
    },
    {
      'titulo': 'Profesión Peligro',
      'descripcion': 'Ryan Gosling en una aventura como doble de riesgo.',
      'imagen': 'assets/images/9.jpg', // Imagen 2
      'trailer': 'https://drive.google.com/uc?export=download&id=1Xv4uBquwrfrqRoqhRK66bCvoyBO726ki', // Trailer 9
    },
  ],
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catálogo de Películas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A0F33), Color(0xFF1C1C1E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0F33), Color(0xFF1C1C1E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
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
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 330, // Altura del contenedor
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
                                videoUrl: pelicula['trailer']!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 12),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 8,
                            color: const Color.fromARGB(255, 7, 59, 204),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      const BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Hero(
                                    tag: pelicula['titulo']!,
                                    child: Image.asset(
                                      pelicula['imagen']!,
                                      height: 200,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF5F5F5),
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
                                      color: Colors.white70,
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
      ),
    );
  }
}
