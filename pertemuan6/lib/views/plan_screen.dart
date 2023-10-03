import 'package:flutter/material.dart';
import 'package:structure_mvc/models/data_layer.dart';
import 'package:structure_mvc/plan_provider.dart';


class PlanScreen extends StatefulWidget{
    final Plan plan;
    const PlanScreen({Key? key, required this.plan}) : super (key:key);

    State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // final plan = Plan();
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  void initState(){
    super.initState();
    scrollController = ScrollController()..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  Widget build (BuildContext context){
    //final plan = PlanProvider.of(context);
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text('Master Plan'),),
          body: Column(children: <Widget>[
            Expanded(child: _builtList(),),
            SafeArea(child: Text(plan!.completenessMessage))
          ]),
          floatingActionButton: _buildAddTaskButton(),
        ),
        onWillPop: (){
          final controller = PlanProvider.of(context);
          controller?.savePlan(plan);
          return Future.value(true);
        });

    return Scaffold(
      appBar: AppBar(title: Text('Master Plan'),),
      body: Column(children: <Widget>[
        Expanded(child: _builtList(),),
        SafeArea(child: Text(plan!.completenessMessage))
        ]),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton(){
    //final plan = PlanProvider.of(context);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        final controller = PlanProvider.of(context);
        controller?.createNewTask(plan);
        setState(() {
          plan!.tasks.add(Task());
        });
      },
    );
  }

  Widget _builtList(){
    //final plan = PlanProvider.of(context);
    return ListView.builder(
      controller: scrollController,
      itemCount: plan!.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
    );
  }

  Widget _buildTaskTile(Task task){
    return Dismissible(key: ValueKey(task),
      background: Container(color: Colors.red),
      direction: DismissDirection.startToEnd,
      onDismissed: (_){
        final controller = PlanProvider.of(context);
        controller?.deleteTask(plan, task);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          value: task.complete,
          onChanged: (selected){
            setState(() {
              task.complete = selected!;
            });
          },
        ),
        title: TextFormField(
          initialValue: task.description,
          onFieldSubmitted: (text){
            setState(() {
              task.description = text;
            });
          },
        ),
      ),
    );

      ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected){
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onFieldSubmitted: (text){
          setState(() {
            task.description = text;
          });
        },
      ),
    );
    /*return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected){
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onFieldSubmitted: (text){
          setState(() {
            task.description = text;
          });
        },
      ),
    );*/
  }
}