import 'package:arch/app/models/apiadvisor_model.dart';

abstract class IApiAdvisor {

  Future<ApiAdvisorModel> getTime();
}