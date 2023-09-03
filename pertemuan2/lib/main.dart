import 'package:flutter/material.dart';
import 'package:pertemuan2/basic_script.dart';
import 'immutable_widget.dart';

void main() => runApp(StaticApp());

class StaticApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      home: BasicScreen()
    );
  }
}