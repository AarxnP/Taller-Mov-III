import 'package:flutter/material.dart';
import 'package:pelicula_01/navegadores/drawer.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Bienvenida'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          'Bienvenido a la aplicación',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
