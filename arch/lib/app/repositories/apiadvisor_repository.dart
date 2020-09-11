import 'package:arch/app/interfaces/client_http_interface.dart';
import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiAdvisorModel> getTime() async {
    var json = await client.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=b43bd2d98bc38cafd259ed6e05bb8a4f");

    var model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
