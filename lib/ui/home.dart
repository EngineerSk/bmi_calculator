import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _bmiValue = 0.0;
  String _displayBMI = '';

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('BMI CALCULATOR'),
        backgroundColor: Colors.redAccent,
      ),

      body: new Container(
        color: Colors.white30,
        child: new ListView(

          scrollDirection: Axis.vertical,
          children: <Widget>[
            Image.asset(
              'images/bmilogo.png',
              height: 150.5,
            ),

            new Container(
                  margin: const EdgeInsets.all(10.75),
                  padding: const EdgeInsets.all(7.5),
                  //height: 223.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color:Colors.black12,
                      gradient: new LinearGradient(colors: [
                        Colors.red,
                        Colors.black,
                        Colors.red,
                      ])
                  ),

                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: '',
                            labelText: 'age',
                            icon: new Icon(Icons.person_outline)
                        ),
                      ),


                      new TextField(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'in metres',
                              labelText: 'Enter your height',
                              icon: new Icon(Icons.view_week)
                          )
                      ),

                      new TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'in kg',
                              labelText: 'Enter your weight',
                              icon: new Icon(Icons.view_week)
                          )
                      ),
                      new Padding(padding: EdgeInsets.all(5.7)),
                      new RaisedButton(
                          onPressed: _calculateBMI,
                          textColor: Colors.white,
                          color: Colors.redAccent,
                          child: new Text(
                            'Calculate BMI',
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.w500,
                              fontSize: 18.5,
                            ),
                          ),
                      )


                    ],
                  ),

              ),
            new Padding(padding: EdgeInsets.all(15.5)),
            new Text(
              '$_displayBMI',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontFamily: 'times new roman',
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 18.5
              ),
            )
          ],
        ),

      ),
    );
  }

  void _calculateBMI() {
    setState(() {
      if(int.parse(_ageController.text).toString().isNotEmpty
          && int.parse(_ageController.text)>0)
      {
        if(_heightController.text.toString().isNotEmpty
            && double.parse(_heightController.text)>0.0)
        {
          if(_weightController.text.toString().isNotEmpty
              && double.parse(_weightController.text)>0.0)
          {
            _bmiValue = double.parse(_weightController.text)
                /pow(double.parse(_heightController.text), 2.0);
          }
        }
      }

      _displayBMIInfo(_bmiValue);
    });
  }

  void _displayBMIInfo(double bmiValue) {

    if(bmiValue<18.5)
      _displayBMI = 'UNDERWEIGHT!!!';
    else if(bmiValue>=18.5&&bmiValue<25)
      _displayBMI = 'HEALTHY WEIGHT!!!';
    else if(bmiValue>=25&&bmiValue<30)
      _displayBMI = 'OVERWEIGHT!!!';
    else
      _displayBMI = 'OBESE!!!';
  }
}

