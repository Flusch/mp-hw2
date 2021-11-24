//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';

import 'hes_db.dart';
import 'hes_update.dart';

class HesDisplay extends StatefulWidget {
  @override
  _HesDisplayState createState() => _HesDisplayState();
}

class _HesDisplayState extends State<HesDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show HES Codes'),
      ),
      body: 
        Center(
          child: 
            Column(
              children: [
                
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: 
                        Text('ID')
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: 
                        Text('HES Code')
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: 
                        Text('Definition')
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: 
                        Text('Edit')
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: 
                        Text('Delete')
                    ),
                  ],
                ),

                FutureBuilder<List>(
                future: printhes(),
                initialData: [],
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, int position) {
                            return Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child:  
                                      Text(snapshot.data[position].id.toString()),
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child:      
                                      Text(
                                        snapshot.data[position].code
                                      ),
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child:
                                      Text(snapshot.data[position].definition),
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child:
                                    FlatButton(
                                      onPressed: (){
                                        sett (snapshot.data[position].id, snapshot.data[position].code, snapshot.data[position].definition);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (BuildContext context) => HesUpdate()),
                                        );
                                      },
                                      child:
                                        Center(
                                          child: 
                                            Icon(
                                              Icons.edit_rounded,
                                              color: Colors.blue,
                                            )
                                        )
                                    ),
                                ),

                                Container(
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  child:
                                    FlatButton(
                                      onPressed: (){
                                        delete(snapshot.data[position].id);
                                        setState(() {}); //sildikten sonra sayfa yenileme
                                      },
                                      child:
                                        Center(
                                          child: 
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )
                                        )
                                    ),
                                ),

                              ]
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
                ),
              ],
            ),
        )
    );
  }
}