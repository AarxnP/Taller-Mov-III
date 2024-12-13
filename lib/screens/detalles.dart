import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetallesPeliculaScreen extends StatefulWidget {
  final String titulo;
  final String descripcion;
  final String videoUrl; // Nueva propiedad para el enlace del video

  DetallesPeliculaScreen({
    required this.titulo,
    required this.descripcion,
    required this.videoUrl, // Se pasa el enlace del video al constructor
  });

  @override
  _DetallesPeliculaScreenState createState() =>
      _DetallesPeliculaScreenState();
}

class _DetallesPeliculaScreenState extends State<DetallesPeliculaScreen> {
  late VideoPlayerController _videoPlayerController;
  double _volume = 1.0; // Volumen por defecto

  @override
  void initState() {
    super.initState();

    // Configuración del controlador de video para Google Drive
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _setVolume(double volume) {
    setState(() {
      _volume = volume;
      _videoPlayerController.setVolume(_volume);
    });
  }

  void _toggleFullScreen() {
    // Agregar lógica para cambiar de tamaño del video
    // Esto se puede lograr con paquetes adicionales como `flutter_screenutil` o `system_overlays` 
    // que permiten cambiar la orientación y la pantalla completa. Si estás en un dispositivo móvil,
    // Flutter tiene un método nativo para esta funcionalidad.
    // En este ejemplo, solo simula el cambio de pantalla.
    print('Pantalla completa activada');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la película
            Text(
              widget.titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 16),
            // Descripción de la película
            Text(
              widget.descripcion,
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(179, 0, 0, 0)),
            ),
            SizedBox(height: 16),
            // Reproductor de video de Google Drive
            _videoPlayerController.value.isInitialized
                ? Column(
                    children: [
                      // Video Player Container
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black45, blurRadius: 10),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Video Progress Indicator
                      VideoProgressIndicator(
                        _videoPlayerController,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.red,
                          bufferedColor: Colors.grey,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      // Botones de control de video
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              _videoPlayerController.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_videoPlayerController.value.isPlaying) {
                                  _videoPlayerController.pause();
                                } else {
                                  _videoPlayerController.play();
                                }
                              });
                            },
                          ),
                          // Control de volumen
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.volume_down, color: const Color.fromARGB(255, 0, 0, 0)),
                                onPressed: () {
                                  if (_volume > 0) {
                                    _setVolume(_volume - 0.1);
                                  }
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.volume_up, color: const Color.fromARGB(255, 0, 0, 0)),
                                onPressed: () {
                                  if (_volume < 1) {
                                    _setVolume(_volume + 0.1);
                                  }
                                },
                              ),
                            ],
                          ),
                          // Botón para pantalla completa
                          IconButton(
                            icon: Icon(Icons.fullscreen, color: const Color.fromARGB(255, 0, 0, 0)),
                            onPressed: _toggleFullScreen,
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
