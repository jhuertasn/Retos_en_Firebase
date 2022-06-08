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
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.food_bank)),
                Tab(icon: Icon(Icons.people_alt)),
              ],
            ),
            title: Text(
              'TabBar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            backgroundColor: Color.fromARGB(137, 71, 177, 120),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bienvenidos al Cine TakyaInc",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Image.network(
                        'https://static.eldiario.es/clip/86011034-d175-42e9-b127-e1553dc2325f_16-9-aspect-ratio_default_0.jpg'),
                  ],
                ),
              ),
              Container(
                child: ListView(
                  children: const <Widget>[
                    ListTile(
                      title: Text(
                        'Presentadores',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(149, 6, 139, 104),
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
