import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(color: Colors.blue),
          //   child: Text(
          //     'Menú de Navegación',
          //     style: TextStyle(color: Colors.white, fontSize: 24),
          //   ),
          // ),
          ListTile(
            title: Text('Pantalla de Bienvenida'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Inicio de Sesión'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            title: Text('Catálogo de Películas'),
            onTap: () {
              Navigator.pushNamed(context, '/catalogo');
            },
          ),
        ],
      ),
    );
  }
}
