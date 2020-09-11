import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel> get time => viewModel.apiAdvisorModel;

  getTime() {
    viewModel.fill();
  }
}
