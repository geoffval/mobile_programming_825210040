import 'package:flutter/material.dart';
import 'package:structure_mvc/controllers/plan_controllers.dart';
import 'package:structure_mvc/models/data_layer.dart';

class PlanProvider extends InheritedWidget{
  final _controller = PlanController();

  PlanProvider({Key? key, required Widget child}):
     super(key: key, child: child);

 @override
 bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;


  static PlanController? of(BuildContext context){
    PlanProvider? provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider?._controller;

  /*final _plans = <Plan>[];

  PlanProvider({Key? key, required Widget child,}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static List<Plan>? of(BuildContext context){
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider?._plans;*/
  }
}