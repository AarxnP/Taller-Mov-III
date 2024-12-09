import 'package:flutter/material.dart';
import 'package:pelicula_01/navegadores/drawer.dart';
import 'package:pelicula_01/screens/detalles.dart';

class CatalogoPeliculasScreen extends StatelessWidget {
  // Ejemplo de datos con categorías
  final Map<String, List<Map<String, String>>> categorias = {
    'Populares': [
      {
        'titulo': 'Película 1',
        'descripcion': 'Una aventura épica.',
        'imagen': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s',
      },
      {
        'titulo': 'Película 2',
        'descripcion': 'Comedia para toda la familia.',
        'imagen': 'https://lumiere-a.akamaihd.net/v1/images/56015l02_bigsal_argentina_intpayoff_4x5_b6776139.jpeg?region=0%2C0%2C2250%2C2813',
      },
    ],
    'Tendencias': [
      {
        'titulo': 'Película 3',
        'descripcion': 'Romance inolvidable.',
        'imagen': 'https://lumiere-a.akamaihd.net/v1/images/garland_instagram_dom_payoff_poster_las_30f591ca.jpeg',
      },
      {
        'titulo': 'Película 4',
        'descripcion': 'Un misterio intrigante.',
        'imagen': 'https://hips.hearstapps.com/hmg-prod/images/poster-ant-man-avispa-quantumania-64048a77bf93b.jpeg?crop=1xw:1xh;center,top&resize=980:*',
      },
    ],
    'Nuevas Llegadas': [
      {
        'titulo': 'Película 5',
        'descripcion': 'Un drama emocionante.',
        'imagen': 'https://hips.hearstapps.com/hmg-prod/images/las-cronicas-de-narnia-66ca0a8ab3845.jpg?crop=1xw:1xh;center,top&resize=980:*',
      },
      {
        'titulo': 'Película 6',
        'descripcion': 'Acción sin límites.',
        'imagen': 'https://m.media-amazon.com/images/S/pv-target-images/b1f6c2cf4ea5eddfbbf134aa84cbf4a78d192cf25f2b3c594886e4d2b99bcdbd._UR1920,1080_CLs%7C1920,1080%7C/G/bundle/BottomRightCardGradient16x9.png,/G/01/digital/video/merch/subs/benefit-id/m-r/Prime/logos/channels-logo-white.png%7C0,0,1920,1080+0,0,1920,1080+1578,847,263,156_SX720_FMjpg_.jpg',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Películas'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      drawer: CustomDrawer(),
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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 350, // Ajusta la altura según sea necesario
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(), // Para evitar el desplazamiento dentro del GridView
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos elementos por fila
                    crossAxisSpacing: 12.0, // Espaciado entre columnas
                    mainAxisSpacing: 12.0, // Espaciado entre filas
                    childAspectRatio: 0.65, // Proporción ancho/alto ajustada para cuadros más grandes
                  ),
                  itemCount: peliculas.length,
                  itemBuilder: (context, index) {
                    final pelicula = peliculas[index];
                    return GestureDetector(
                      onTap: () {
                        // Navegar a la pantalla de detalles
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetallesPeliculaScreen(
                              titulo: pelicula['titulo']!,
                              descripcion: pelicula['descripcion']!,
                              // imagen: pelicula['imagen']!,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.network(
                                pelicula['imagen']!,
                                height: 200, // Ajusta el tamaño de la imagen
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pelicula['titulo']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
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
                                  color: Colors.black54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
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
