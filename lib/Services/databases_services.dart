import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapp/Services/globals.dart';

import '../models/task.dart';

class DatabaseServices{

  static Future<Task> add(String name) async {
    Map data = {
      "name": name,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+'/add');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    Task task = Task.fromMap(responseMap);

    return task;
  }

  static Future<List<Task>> getTasks() async {
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Task> tasks = [];
    for(Map taskMap in responseList){
      Task task = Task.fromMap(taskMap);
      tasks.add(task);
    }
    return tasks;
  }
  static Future<http.Response> update(int id) async{
    var url = Uri.parse(baseURL+'/update/$id');
    http.Response response = await http.put(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
  static Future<http.Response> remove(int id) async{
    var url = Uri.parse(baseURL+'/delete/$id');
    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

}