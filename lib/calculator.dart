//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String islem = '0';
  String sonuc = '0';

  pressButton(String txt){
    setState(() {
      if (txt == 'C') {
        islem = '0';
        sonuc = '0';
      }
      else if (txt == 'del') {
        islem = islem.substring(0, islem.length - 1);
        if (islem == '') {
          islem = '0';
        }
      }
      else if (txt == '=') {

        try{
          Parser p = new Parser();
          Expression exp = p.parse(islem);

          ContextModel cm = ContextModel();
          sonuc = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          sonuc = 'Error';
        }
      }
      else {
        if (islem == '0') {
          islem = txt;
        }
        else {
          islem = islem + txt;
        }
      }
    });
  }

  Widget buton(String t, double h, Color c){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * h,
      color: c,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid
          )
        ),
        padding: EdgeInsets.all(16),
        onPressed: () => pressButton(t), 
        child: Text(
          t,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.white
          )
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      body: Column(
        children: <Widget>[
          
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(islem, style: TextStyle(fontSize: 40),),
          ),

          Expanded(
            child: Divider()
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(sonuc, style: TextStyle(fontSize: 32),),
          ),

          Expanded(
            child: Divider()
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buton('C', 1, Colors.redAccent),
                        buton('del', 1, Colors.redAccent),
                        buton('+', 1, Colors.blue),
                      ]  
                    ),

                    TableRow(
                      children: [
                        buton('7', 1, Colors.grey),
                        buton('8', 1, Colors.grey),
                        buton('9', 1, Colors.grey),
                      ]  
                    ),

                    TableRow(
                      children: [
                        buton('4', 1, Colors.grey),
                        buton('5', 1, Colors.grey),
                        buton('6', 1, Colors.grey),
                      ]  
                    ),

                    TableRow(
                      children: [
                        buton('1', 1, Colors.grey),
                        buton('2', 1, Colors.grey),
                        buton('3', 1, Colors.grey),
                      ]  
                    ),

                    TableRow(
                      children: [
                        buton('00', 1, Colors.grey),
                        buton('0', 1, Colors.grey),
                        buton('.', 1, Colors.grey),
                      ]  
                    )
                ]
                )
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buton('-', 1, Colors.blue),
                      ]
                    ),

                    TableRow(
                      children: [
                        buton('*', 1, Colors.blue),
                      ]
                    ),

                    TableRow(
                      children: [
                        buton('/', 1, Colors.blue),
                      ]
                    ),

                    TableRow(
                      children: [
                        buton('=', 2, Colors.greenAccent),
                      ]
                    )
                ],)
              )

            ],
          )

        ],
      ),
    );
  }
}