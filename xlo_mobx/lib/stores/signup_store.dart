import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @observable
  String email;
  @action
  set(String value) => email = value;

  @computed
  bool get nameValid => name != null || name.length > 6;
  String get nameError {
    if (name == null || nameValid) {
      return null;
    }

    if (name.isEmpty) {
      return 'Campo obrigatorio';
    }

    return "Nome muito curto";
  }
}
