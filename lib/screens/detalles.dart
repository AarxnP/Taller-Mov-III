import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetallesPeliculaScreen extends StatefulWidget {
  final String titulo;
  final String descripcion;
  final String videoUrl;

  DetallesPeliculaScreen({
    required this.titulo,
    required this.descripcion,
    required this.videoUrl,
  });

  @override
  _DetallesPeliculaScreenState createState() => _DetallesPeliculaScreenState();
}

class _DetallesPeliculaScreenState extends State<DetallesPeliculaScreen> {
  late VideoPlayerController _videoPlayerController;
  double _volume = 1.0;

  @override
  void initState() {
    super.initState();
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
    print('Pantalla completa activada');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0F33), Color(0xFF1C1C1E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título estilizado
              Text(
                widget.titulo,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              // Descripción estilizada
              Text(
                widget.descripcion,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Contenedor de video estilizado
              _videoPlayerController.value.isInitialized
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 12),
              // Indicador de progreso
              _videoPlayerController.value.isInitialized
                  ? VideoProgressIndicator(
                      _videoPlayerController,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Colors.redAccent,
                        bufferedColor: Colors.grey,
                        backgroundColor: Colors.black45,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 16),
              // Controles de video
              _videoPlayerController.value.isInitialized
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Botón Play/Pause
                        IconButton(
                          icon: Icon(
                            _videoPlayerController.value.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                            size: 48,
                            color: Colors.redAccent,
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
                              icon: const Icon(Icons.volume_down, color: Colors.white70),
                              onPressed: () => _setVolume((_volume - 0.1).clamp(0.0, 1.0)),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.volume_up, color: Colors.white70),
                              onPressed: () => _setVolume((_volume + 0.1).clamp(0.0, 1.0)),
                            ),
                          ],
                        ),
                        // Botón de pantalla completa
                        IconButton(
                          icon: const Icon(Icons.fullscreen, color: Colors.white70, size: 30),
                          onPressed: _toggleFullScreen,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
