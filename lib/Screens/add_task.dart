import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/tasks_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskName ="";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Add New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black54,
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: (val){
              taskName = val;
            },
          ),
          const SizedBox(height: 10),
          TextButton(onPressed: (){
            if(taskName.isNotEmpty){
              Provider.of<TasksData>(context,listen: false)
                  .add(taskName);
              Navigator.pop(context);
            }
          }, child: const Text(
            'Add',
            style: TextStyle( color: Colors.white),
          ),
            style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
          ),
        ],
      ),
    );
  }
}
