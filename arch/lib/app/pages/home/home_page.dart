import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/pages/home/home_controller.dart';
import 'package:arch/app/repositories/apiadvisor_repository.dart';
import 'package:arch/app/services/client_http_service.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';
import './components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(
    ApiadvisorViewModel(
      ApiadvisorRepository(ClientHttpService()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          controller.getTime();
        },
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiAdvisorModel>(
              valueListenable: controller.time,
              builder: (context, model, child) {
                if (model?.text == null) {
                  return Center(child: CircularProgressIndicator());
                }
                return Text(model.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
