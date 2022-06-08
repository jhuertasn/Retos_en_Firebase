import 'package:flutter/material.dart';

class Pasos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PasosdelApp(),
    );
  }
}

class PasosdelApp extends StatefulWidget {
  const PasosdelApp({
    Key? key,
  }) : super(key: key);
  //final String title;
  @override
  State<PasosdelApp> createState() => _PasosdelAppState();
}

class _PasosdelAppState extends State<PasosdelApp> {
  int _actualpaso = 0;
  List<Step> mispasos = [
    const Step(
        title: Text("Paso 1"),
        content: Text("Ir hacia la pestaña de Lista de Estudiantes.")),
    const Step(
        title: Text("Paso 2"),
        content: Text("Ingresar Nombre del Estudiante.")),
    const Step(
        title: Text("Paso 3"),
        content: Text("Ingresar codigo del Estudiante.")),
    const Step(
        title: Text("Paso 4"),
        content: Text("Ingresar carrera que pertenece el estudiante.")),
    const Step(
        title: Text("Paso 5"),
        content: Text("Ingresar promedio final del estudiante.")),
    const Step(
        title: Text("Paso 6"),
        content: Text(
            "Pulsar crear para crear registro de estudiante en la base de datos.")),
    const Step(
        title: Text("Paso 7"),
        content: Text(
            "Si tiene el codigo de estudiante presione Leer para ver si esta registrado.")),
    const Step(
        title: Text("Paso 8"),
        content: Text(
            "Si desea actualizar datos dirijase a codigo de estudiante y presione Actualizar.")),
    const Step(
        title: Text("Paso 9"),
        content: Text(
            "Si desea eliminar un Registro, seleccione codigo de estudiante y presione Eliminar.")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Stepper(
          //Indica el paso actual del Stepper
          currentStep: _actualpaso,
          steps: mispasos,
          //cambiamos la forma del Stepper
          type: StepperType.vertical,
          onStepContinue: () {
            setState(() {
              if (_actualpaso < mispasos.length - 1) {
                _actualpaso++;
              } else {
                _actualpaso = 0;
              }
            });
            print("Mi paso actual es " + _actualpaso.toString());
          },
          onStepCancel: () {
            setState(() {
              if (_actualpaso > 0) {
                _actualpaso--;
              } else {
                _actualpaso = 0;
              }
            });

            print("Mi paso actual es " + _actualpaso.toString());
          },
          onStepTapped: (Paso) {
            setState(() {
              _actualpaso = Paso;
            });
            print("Mi paso actual es " + _actualpaso.toString());
          },
        ),
      ),
    );
  }
}
