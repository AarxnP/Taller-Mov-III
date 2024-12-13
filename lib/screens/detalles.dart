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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Descripción de la película
            Text(
              widget.descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            // Reproductor de video de Google Drive
            _videoPlayerController.value.isInitialized
                ? Column(
                    children: [
                      Container(
                        height: 200,
                        child: VideoPlayer(_videoPlayerController),
                      ),
                      VideoProgressIndicator(
                        _videoPlayerController,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.red,
                          bufferedColor: Colors.grey,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _videoPlayerController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
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
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
