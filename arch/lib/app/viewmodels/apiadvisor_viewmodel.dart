import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/foundation.dart';

class ApiadvisorViewModel {
  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);
  final IApiAdvisor apiAdvisor;

  ApiadvisorViewModel(this.apiAdvisor);

  fill() async {
    apiAdvisorModel.value = await apiAdvisor.getTime();
  }
}
