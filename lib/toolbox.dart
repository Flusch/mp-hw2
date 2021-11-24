//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';

import 'hes_main.dart';
import 'calculator.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //leading, title dan önce göstermek için
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
          },
        ),
        title: Text('Toolbox'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[
          //Hes Code Display
          Card(
            child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Hesdisplay()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Icon(Icons.code,),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hes Codes',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.withAlpha(200)),
                      ),
                      SizedBox(height: 8.0), // boşluk
                      Text(
                        'Manage your Hes Codes',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),)
          ),

          //Hesap makinesi
          Card(
            child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Calculator()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Icon(Icons.calculate,),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Calculator',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.withAlpha(200)),
                      ),
                      SizedBox(height: 8.0), // boşluk
                      Text(
                        'Calculate',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),)
          ),

          //To-Do List
          Card(
            child: InkWell(
            onTap: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => ToDoList()),
              );*/
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Icon(Icons.check_box,),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'To Do List',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.withAlpha(200)),
                      ),
                      SizedBox(height: 8.0), // boşluk
                      Text(
                        'Check your lists.',
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),)
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}