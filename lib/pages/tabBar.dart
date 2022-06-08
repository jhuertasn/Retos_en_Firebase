import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(49),
            child: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.food_bank)),
                  Tab(icon: Icon(Icons.people_alt)),
                ],
              ),
              /* title: Text(
                'TabBar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),*/
              backgroundColor: Color.fromARGB(134, 18, 221, 201),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bienvenidos al App de Docente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.network(
                      'https://definicion.de/wp-content/uploads/2008/09/profesor.jpg',
                      height: 300,
                      width: 300,
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView(
                  children: const <Widget>[
                    ListTile(
                      title: Text(
                        'Desarrolladores',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(148, 196, 141, 12),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 12),
                    ListTile(
                      leading: Icon(Icons.circle_notifications_sharp),
                      title: Text('Jordan Angel Huertas Negron'),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Brishman Neeson Cano Leon'),
                    ),
                    ListTile(
                      leading: Icon(Icons.circle_notifications_rounded),
                      title: Text('Sabrina Oroya Sanchez'),
                    ),
                    ListTile(
                      leading: Icon(Icons.circle_notifications_outlined),
                      title: Text('Sebastian Crispin Manrique'),
                    ),
                    ListTile(
                      leading: Icon(Icons.circle_notifications_outlined),
                      title: Text('Alejandro obregon pajuelo'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
