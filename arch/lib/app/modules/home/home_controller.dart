import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:arch/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get time => viewModel.apiAdvisorModel;

  getTime() {
    viewModel.fill();
  }
}
