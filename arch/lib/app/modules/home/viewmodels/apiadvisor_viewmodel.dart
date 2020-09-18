import 'package:arch/app/modules/home/models/apiadvisor_model.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/foundation.dart';

class ApiadvisorViewModel {
  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel>(null);
  final IApiAdvisor apiAdvisor;

  ApiadvisorViewModel(this.apiAdvisor);

  fill() async {
    try {
      apiAdvisorModel.value = await apiAdvisor.getTime();
    } catch (ex) {
      print(ex);
    }
  }
}
