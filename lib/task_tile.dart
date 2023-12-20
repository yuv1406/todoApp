import 'package:flutter/material.dart';
import 'package:todoapp/tasks_data.dart';

import 'models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TasksData tasksData;
  const TaskTile({Key?key,required this.task, required this.tasksData})
  :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          activeColor: Colors.lightBlue,
          value: task.status,
          onChanged: (checkbox){
            tasksData.update(task);
          },
        ),
        title: Text(
          task.name,
          style: TextStyle(
            decoration:
              task.status ? TextDecoration.lineThrough:TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: (){
            tasksData.delete(task);

        },
        ),
      )
    );
  }
}
