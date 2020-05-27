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
      body: ListView.builder(
          itemCount: _taks.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _taks[index].name,
                      style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            );
          }),
    );
  }

  void _getAll() {
    _taskRepository.get().then((response) {
      setState(() {
        _taks = response;
      });
    });
  }
}
