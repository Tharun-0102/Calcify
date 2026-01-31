import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import './calculator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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

