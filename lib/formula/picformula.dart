import 'package:flutter/material.dart';

class PICFormula extends StatefulWidget {
  @override
  _PICFormulaState createState() => _PICFormulaState();
}

class _PICFormulaState extends State<PICFormula> {
  @override
  Widget build(BuildContext context) {
    Widget registerCalculationUI(Function timerCalculation) {
      int prescalar;
      double delay;
      double frequency;
      double result = 0;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 500,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Prescalar"),
                onChanged: (value) {
                  prescalar = int.parse(value);
                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Delay in milliSeconds"),
                onChanged: (value) {
                  delay = double.parse(value);
                },
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Frequency in MHz"),
                onChanged: (value) {
                  frequency = double.parse(value);
                },
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                  child: Text("Calculate"),
                  onPressed: () {
                    if (prescalar != null &&
                        delay != null &&
                        frequency != null) {
                      setState(() {
                        print("$prescalar $delay $frequency");
                        result = timerCalculation(prescalar, delay, frequency);
                        print(result);
                      });
                    }
                  }),
              Text("The result is $result")
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("EngineerEd"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            registerCalculationUI(timer0Calculation),
            registerCalculationUI(timer1Calculation),
            registerCalculationUI(timer2Calculation)
          ],
        ),
      ),
    );
  }

  timer0Calculation(int preScalar, double delay, double frequency) {
    double result = 256 - ((delay * frequency * 1000) / (preScalar * 4));
    return result;
  }

  timer1Calculation(int preScalar, double delay, double frequency) {
    double result = 65536 - ((delay * frequency) / (preScalar * 4));
    return result;
  }

  timer2Calculation(int preScalar, double delay, double frequency) {
    double result = 256 - ((delay * frequency) / (preScalar * 4));
    return result;
  }
}
