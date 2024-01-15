import 'package:flutter/material.dart';

Widget addH(double h) {
  return SizedBox(height: h);
}

Widget addW(double w) {
  return SizedBox(width: w);
}

double calculateRoundPrice({required double inputNum}) {
  double result;
  //price rounding
  double myDouble = inputNum / 1000;
  // Here I used 1 decimal. You can use another value in toStringAsFixed(x)
  result = double.parse((myDouble).toStringAsFixed(1));
  result = result.round() * 1000;
  print('print cart =price');
  print(result);
  return result;
}