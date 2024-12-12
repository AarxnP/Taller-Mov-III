  import 'package:firebase_core/firebase_core.dart';
  import 'package:pelicula_01/screens/registro.dart';
  import 'firebase_options.dart';
  import 'package:flutter/material.dart';
  import 'package:pelicula_01/screens/bienvenida_screen.dart';
  import 'package:pelicula_01/screens/catalogo_screen.dart';
  import 'package:pelicula_01/screens/login_screen.dart';

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => BienvenidaScreen(),
          '/login': (context) => LoginScreen(),
          '/catalogo': (context) => CatalogoPeliculasScreen(),
          '/RegisterScreen': (context) => RegisterScreen(), // Agrega esta línea
        },
      );
    }
  }
