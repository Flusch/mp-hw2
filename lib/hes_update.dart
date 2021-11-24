//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';

import 'hes_db.dart';

var hscd;
var def;
var id;

void sett(int i, String hs, String df){
    hscd = hs;
    def = df;
    id = i;
}

class HesUpdate extends StatefulWidget {
  @override
  _HesUpdateState createState() => _HesUpdateState();
}

class _HesUpdateState extends State<HesUpdate> {
  final _codeController = TextEditingController();
  final _defController = TextEditingController();

  void initState() {
    _codeController.text = hscd;
    _defController.text = def;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit HES Codes'),
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
                      child: Text('UPDATE'),
                      elevation: 8.0,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      onPressed: () async{
                        var code = _codeController.text;
                        var def = _defController.text;
                        var tmp = Hes(
                          id: id,
                          code: code,
                          definition: def,
                        );
                        await update(tmp);
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