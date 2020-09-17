import 'package:arch/app/app_module.dart';
import 'package:arch/app/interfaces/client_http_interface.dart';
import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {

  WidgetsFlutterBinding.ensureInitialized();

  initModule(AppModule(), changeBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);

  final mock = Modular.get<IClientHttp>();
  final viewModel = Modular.get<ApiadvisorViewModel>();

  group(
    'ApiAdvisorViewModel',
    () {
      test('ApiAdvisorViewModel error', () async {
        when(mock.get("")).thenThrow(
          Exception("error"),
        );

        await viewModel.fill();
        expect(viewModel.apiAdvisorModel.value, null);
      });

      test('ApiAdvisorViewModel success', () async {
        when(mock.get("url")).thenAnswer(
          (_) => Future.value([
            ApiAdvisorModel(
              country: "BR",
              date: "11/09/2020",
              text: "asdadasdas",
            ).toJson()
          ]),
        );
        await viewModel.fill();
        expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
      });
    },
  );
}
