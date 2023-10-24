import 'package:flutter/material.dart';
import 'package:todoapp/home_page.dart';
import 'package:todoapp/plan_provider.dart';
import 'package:todoapp/views/plan_creator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: MyHomePage(),
      ),
    );
  }
}