//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';

import 'hes_add.dart';
import 'hes_display.dart';

class Hesdisplay extends StatefulWidget {
  @override
  _HesdisplayState createState() => _HesdisplayState();
}

class _HesdisplayState extends State<Hesdisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HES Code Display'),
      ),
      body:
        Center(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => HesDisplay()),
                    );
                  },
                  child: 
                    Text(
                      'Show Hes Codes',
                      style: TextStyle(color: Colors.white),
                    ),
                ),

                FlatButton(
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => HesAdd()),
                    );
                  },
                  child: 
                    Text(
                      'Add Hes Codes',
                      style: TextStyle(color: Colors.white),
                    ),
                ),
              ],
            )
      )
    );
  }
}