import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetallesPeliculaScreen extends StatefulWidget {
  final String titulo;
  final String descripcion;

  DetallesPeliculaScreen({required this.titulo, required this.descripcion});

  @override
  _DetallesPeliculaScreenState createState() => _DetallesPeliculaScreenState();
}

class _DetallesPeliculaScreenState extends State<DetallesPeliculaScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();

    // ID del video de YouTube (extraído del enlace)
    const String videoId = 'aEvrOb4YZ1E'; // Cambia esto por el ID de tu video

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
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
            // Reproductor de YouTube
            YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
