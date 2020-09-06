import 'package:flutter/material.dart';

// Importaciones personales
import 'package:componentes/src/pages/home_page.dart';
//import 'package:componentes/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componenetes App',
      home: HomePage(),
    );
  }
}
