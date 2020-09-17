import 'package:arch/app/modules/home/home_controller.dart';
import 'package:arch/app/modules/home/home_page.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository.dart';
import 'package:arch/app/modules/home/repositories/apiadvisor_repository_interface.dart';
import 'package:arch/app/modules/home/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => ApiadvisorViewModel(i.get())),
        Bind<IApiAdvisor>((i) => ApiadvisorRepository(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => HomePage()),
      ];
}
