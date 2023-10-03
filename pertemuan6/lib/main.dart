import 'package:flutter/material.dart';
import 'package:structure_mvc/plan_provider.dart';
import 'views/plan_screen.dart';
import 'views/plan_creator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: PlanCreatorScreen(),
      ),
    );
  }
}
