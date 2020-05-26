import 'package:flutter/material.dart';
import 'package:todoapp/repositories/database-provider.repository.dart';

import 'package:todoapp/repositories/task.reposiotry.dart';
import 'package:todoapp/models/task.model.dart';
import 'package:todoapp/shared/enums/status-type.enum.dart';

import '../models/task.model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskRepository _taskRepository = TaskRepository(DatabaseProvider());
  List<TaskModel> _taks = List();

  @override
  void initState() {
    super.initState();
    TaskModel model = TaskModel(description: "Teste", name: "Dormir");
    _taskRepository.create(model);
    _taskRepository.create(TaskModel(description: "Teste", name: "Dormir 2"));
    _getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
    );
  }

  void _getAll() {
    _taskRepository.get().then((response) {
      setState(() {
        _taks = response;
        print(_taks.length);
      });
    });
  }
}
