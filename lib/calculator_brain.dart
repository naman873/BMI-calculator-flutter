import 'dart:math';
import 'main.dart';
import 'package:flutter/cupertino.dart';

class CalculatorBrain{

  CalculatorBrain({@required this.height,@required this.weight});

  final int height;
  final int weight;
  double _bmi;


  String calclulate_bmi(){
    _bmi= weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }



    String getInterpretation(){
      if (_bmi>=25){
        return 'You have a higher then normal body weight . Try to exercise more.';
      }
      else if(_bmi>18.5){
        return 'you have a normal bidy weight . Good job.';
      }
      else{
        return 'You have a lower then the normal body weight. You can eat a bit more.';
      }

  }


}