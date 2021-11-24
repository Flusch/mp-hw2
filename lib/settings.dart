//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  onPressed: (){
                    
                  },
                  child: 
                    Text(
                      'Red',
                      style: TextStyle(color: Colors.white),
                    ),
                ),

                FlatButton(
                  color: Colors.pink,
                  onPressed: (){
                    
                  },
                  child: 
                    Text(
                      'Pink',
                      style: TextStyle(color: Colors.white),
                    ),
                ),
              ],
            )
      )
    );
  }
}