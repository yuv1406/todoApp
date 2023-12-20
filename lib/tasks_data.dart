import 'package:flutter/cupertino.dart';
import 'package:todoapp/Services/databases_services.dart';

import 'models/task.dart';

class TasksData extends ChangeNotifier{
  List<Task> tasks = [];

  void add(String taskName) async{
    Task task = await DatabaseServices.add(taskName);
    tasks.add(task);
    notifyListeners();
  }
  void update(Task task){
    task.toggle();
    DatabaseServices.update(task.id);
    notifyListeners();
  }
  void delete(Task task){
    tasks.remove(task);
    DatabaseServices.remove(task.id);
    notifyListeners();
  }
}