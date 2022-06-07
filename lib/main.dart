import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'CRUD EN FLUTTER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  inputForm(String sugerencia, Function getCampo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: sugerencia,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0))),
        onChanged: (String name) {
          getCampo(name);
        },
      ),
    );
  }

  btnCrud(String nombre, Color color, Function accion) {
    return ElevatedButton(
      onPressed: () {
        accion();
      },
      child: Text(nombre),
      style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  viewReg(document, string) {
    try {
      if (document[string] != null) {
        return Expanded(child: Text(document[string]));
      }
    } catch (e) {
      return const Expanded(child: Text("vacío"));
    }
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String estudianteNombre = "";
  String estudianteCodigo = "";
  String estudiantePrograma = "";
  String estudianteCalificacion = "";

  getEstudianteCodigo(x) {
    estudianteCodigo = x;
  }

  getEstudianteNombre(x) {
    estudianteNombre = x;
  }

  getEstudiantePrograma(x) {
    estudiantePrograma = x;
  }

  getEstudianteCalificacion(x) {
    estudianteCalificacion = x;
  }

  crearRegistro() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(estudianteCodigo);

    documentReference
        .set(
          {
            "id": estudianteCodigo,
            "nombre": estudianteNombre,
            "calificación": estudianteCalificacion,
            "programa": estudiantePrograma
          },
          SetOptions(merge: true),
        )
        .catchError((error) => print("Failed to merge data: $error"))
        .whenComplete(() {
          print("$estudianteNombre registrado");
        });
  }

  leerRegistro() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(estudianteCodigo)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("Document data: ${documentSnapshot.data()}");
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        print("Document data: ${data['nombre']}");

        AlertDialog alerta = AlertDialog(
          title: const Text("LECTURA DE ESTUDIANTE"),
          content: Column(
            children: [
              Text("Nombre: ${data['nombre']}"),
              Text("Id: ${data['id']}"),
              Text("Promedio: ${data['calificación']}"),
              Text("Programa: ${data['programa']}")
            ],
          ),
        );
        showDialog(context: context, builder: (BuildContext context) => alerta);
      } else {
        print("Registro no existe en la Base de datos");
      }
    });
  }

  actualizarRegistro() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(estudianteCodigo);

    documentReference
        .update({
          "id": estudianteCodigo,
          "nombre": estudianteNombre,
          "calificación": estudianteCalificacion,
          "programa": estudiantePrograma
        })
        .then((value) => print("Registro actualizado"))
        .catchError(
            (error) => print("Actualización de registrol fallido: $error"));
  }

  eliminarRegistro() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(estudianteCodigo);

    documentReference
        .delete()
        .then((value) => print("Registro Eliminado"))
        .catchError(
            (error) => print("Eliminación de registro fallido: $error"));
  }

  List usuarios = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    //lamando a la coleccion de firebase
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");

    //haciendo una consulta en firebase
    QuerySnapshot users = await collectionReference.get();
    // la cantidad de registros que tenemos en docs y si es diferente
    // de cero recorriendo con un array de elementos
    print("ESTO ES");
    print(users.docs.toString());
    if (users.docs.isNotEmpty) {
      for (var doc in users.docs) {
        // ignore: avoid_print
        print(doc.data());
        usuarios.add(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.inputForm("Nombre", getEstudianteNombre),
                widget.inputForm("Codigo de Estudiante", getEstudianteCodigo),
                widget.inputForm("Carrera", getEstudiantePrograma),
                widget.inputForm("Promedio", getEstudianteCalificacion),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    widget.btnCrud("Crear", Colors.green, crearRegistro),
                    widget.btnCrud("Leer", Colors.yellow, leerRegistro),
                    widget.btnCrud(
                        "Actualizar", Colors.orange, actualizarRegistro),
                    widget.btnCrud("Eliminar", Colors.red, eliminarRegistro)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: const <Widget>[
                      Expanded(
                          child: Text(
                        "Nombre",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        "Código",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        "Promedio",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          child: Text(
                        "Carrera",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return Row(
                              textDirection: TextDirection.ltr,
                              children: [
                                widget.viewReg(documentSnapshot, "id"),
                                widget.viewReg(documentSnapshot, "nombre"),
                                widget.viewReg(
                                    documentSnapshot, "calificación"),
                                widget.viewReg(documentSnapshot, "programa")
                              ],
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                        );
                      } else {
                        return const Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
              ]),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
