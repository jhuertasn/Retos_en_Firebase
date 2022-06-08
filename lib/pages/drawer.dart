import 'package:flutter/material.dart';
import 'package:retos_en_firebase/pages/CrudApp.dart';
import 'package:retos_en_firebase/pages/pasosdelapp.dart';
import 'package:retos_en_firebase/pages/tabBar.dart';
import '/main.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selecDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return inicio();
      case 1:
        return TabBarDemo();
      case 2:
        return crudApp(
          title: 'Registro de Estudiantes',
        );
      case 3:
        return PasosdelApp();
    }
  }

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selecDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(51, 134, 230, 24),
        title: Text(
          'Registro App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Ejercicio Crud',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                accountEmail: Text('Docente: Henry Villanueva Monrroy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                currentAccountPicture: Image.network(
                    'https://img2.freepng.es/20200413/cx/transparent-icon-design-5e9514e3e94e76.6287660515868285159556.jpg')),
            ListTile(
              title: Text('Autores'),
              leading: Icon(Icons.vaccines),
              selected: (2 == _selecDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Lista de Estudiantes'),
              leading: Icon(Icons.list_alt),
              selected: (2 == _selecDrawerItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: Text('Pasos para Usar el App'),
              leading: Icon(Icons.cake_outlined),
              selected: (2 == _selecDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            Divider(
              height: 25,
            ),
            ListTile(
              title: Text('atrás'),
              leading: Icon(Icons.arrow_back),
              selected: (0 == _selecDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selecDrawerItem),
    );
  }
}
