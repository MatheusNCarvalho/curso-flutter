import 'package:arch/app/interfaces/client_http_interface.dart';
import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/repositories/apiadvisor_repository.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  final mock = ClientHttpMockito();
  final viewModel = ApiadvisorViewModel(
    ApiadvisorRepository(
      mock,
    ),
  );

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
