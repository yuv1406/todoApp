import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Services/databases_services.dart';
import 'package:todoapp/tasks_data.dart';

import '../models/task.dart';
import '../task_tile.dart';
import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;

  getTasks() async{
    tasks = await DatabaseServices.getTasks();
    Provider.of<TasksData>(context, listen: false).tasks = tasks!;
    setState(() {    });
  }

  @override
  void initState(){
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return tasks ==null?
        const Scaffold(
          body: Center(
            child: CircularProgressIndicator() ,
          ),
        )
     : Scaffold(
      appBar: AppBar(
        title: Text('Todo Tasks (${Provider.of<TasksData>(context).tasks.length})',
      ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
    ),
          body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Consumer<TasksData>(
              builder: (context, tasksData,child){
                return ListView.builder(
                  itemCount: tasksData.tasks.length,
                    itemBuilder: (context,index){
                    Task task = tasksData.tasks[index];
                    return TaskTile(
                      task: task,
                      tasksData: tasksData,
                    );
                    }
                );

              },
            ),
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context){
            return const AddTaskScreen();
          });
        },

      ),
    );
  }
}
