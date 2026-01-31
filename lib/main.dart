import 'package:flutter/material.dart';
import './calculator.dart';

void main(){
  runApp(calc());
}

class calc extends StatelessWidget{
  const calc({super.key});
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    
    home:Calculator());
  }
}

