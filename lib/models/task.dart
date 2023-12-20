class Task{
  final int id;
  final String name;
  bool status;


  Task({
    required this.id,
    required this.name,
    this.status = false,
  });

  factory Task.fromMap(Map taskMap){
    return Task(id: taskMap['id'], name:taskMap['name'], status: taskMap['status']);
  }
  void toggle(){
    status = !status;
  }
}