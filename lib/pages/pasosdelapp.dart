import 'package:flutter/material.dart';

class Pasos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Pasos Para entrar al cine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _actualpaso = 0;
  List<Step> mispasos = [
    const Step(
        title: Text("Paso 1"),
        content: Text(
            "Reservar tus asientos en la pagina web o comprar tus boletos en la boleteria")),
    const Step(
        title: Text("Paso 2"),
        content: Text(
            "Portar mascarilla KN95 y desinfectarse las manos antes de ingresar al cine")),
    const Step(
        title: Text("Paso 3"),
        content: Text(
            "Presentar tus boletos ante la encargada de la entrada del cine.")),
    const Step(
        title: Text("Paso 4"),
        content: Text(
            "Opcional: si gustas puedes comprar tu bebida favorita y canchita antes de ingresar.")),
    const Step(
        title: Text("Paso 5"),
        content:
            Text("Entrar a la sala de cine y ubicarse en su asiento elegido.")),
    const Step(
        title: Text("Paso 6"),
        content: Text(
            "Observar y ubicar las salidas de emergencia ante una eventualidad.")),
    const Step(title: Text("Paso 7"), content: Text("Disfrutar la pelicula.")),
    const Step(
        title: Text("Paso 8"),
        content: Text(
            "si tienes basura a la hora de salir nuestros colaboradores te estaran esperando con los tachos de basura.")),
    const Step(
        title: Text("Paso 9"),
        content: Text(
            "No te olvides comentar a tus amigos de tu experiencia en Cine TakyaINC.")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
