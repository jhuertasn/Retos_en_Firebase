import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:retos_en_firebase/pages/drawer.dart';

void main() {
  //todas las dependencias de flutter se inicializan antes de lanzar
  // los widgets
  WidgetsFlutterBinding.ensureInitialized();
  //ir a la carpeta de android para inicializar firebase
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro App',
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(137, 8, 143, 210),
      ),
    );
  }
}

class inicio extends StatelessWidget {
  const inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Hola",
            style: TextStyle(fontFamily: 'Marker', fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            'https://veedorfiscal.files.wordpress.com/2014/09/registro1.jpg?w=627&h=470',
            height: 300,
            width: 300,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Bienvenido a Registro de estudiantes TakyaINC",
            //cambiar orientacion del texto a centrado
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Marker', fontSize: 23),
          )
        ],
      ),
    );
  }
}
