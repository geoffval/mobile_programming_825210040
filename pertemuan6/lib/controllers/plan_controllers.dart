import 'package:structure_mvc/models/data_layer.dart';
import 'package:structure_mvc/services/plan_services.dart';

class PlanController{
  final services = PlanServices();

  List<Plan> get plans => List.unmodifiable(services.getAllPlans());

  void addNewPlan(String name){
    if(name.isEmpty) return;

    name = _checkForDuplicate(plans.map((plan) => plan.name), name);

    //final plan = Plan()..name = name;
    //_plans.add(plan);

    services.createPlan(name);
  }

  void savePlan(Plan plan){
    services.savePlan(plan);
  }

  void deletePlan(Plan plan){
    services.delete(plan);
  }

  void createNewTask(Plan plan, [String? description]){
    if(description == null || description.isEmpty){
      description = 'new Task';
    }

    description = _checkForDuplicate(plan.tasks.map((task) => task.description), description);
    services.addTask(plan, description);
    //final task = Task()..description = description;
    //plan.tasks.add(task);
  }

  void deleteTask(Plan plan, Task task){
    services.deleteTask(plan, task);
    //plan.tasks.remove(task);
  }

  String _checkForDuplicate(Iterable<String> items, String text){
    final duplicatedCount = items.where((item) => item.contains(text)).length;
    if (duplicatedCount > 0){
      text += '${duplicatedCount + 1}';
    }
    return text;
  }
}

