//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';
import 'hes_db.dart';

class HesAdd extends StatefulWidget {
  @override
  _HesAddState createState() => _HesAddState();
}

class _HesAddState extends State<HesAdd> {

  final _codeController = TextEditingController();
  final _defController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add HES Codes'),
      ),
      body: 
        Center(
          child: 
            Column(
              children: [
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: 'HES Code',
                  ),
                ),

                TextField(
                  controller: _defController,
                  decoration: InputDecoration(
                    labelText: 'Definition',
                  ),
                ),

                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      color: Colors.redAccent,
                      child: Text('CLEAR'),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      onPressed: () {
                        _codeController.clear();
                        _defController.clear();
                      },
                    ),
                    RaisedButton(
                      color: Colors.greenAccent,
                      child: Text('ADD'),
                      elevation: 8.0,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      onPressed: () async{
                        var code = _codeController.text;
                        var def = _defController.text;
                        var tmp = Hes(
                          code: code,
                          definition: def,
                        );
                        await insert(tmp);
                        _codeController.text = '';
                        _defController.text = '';
                      },
                    ),
                  ],
                ),

              ],
            ),
        ),
    );
  }
}