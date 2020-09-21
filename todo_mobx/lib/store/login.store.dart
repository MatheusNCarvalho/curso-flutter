import 'package:mobx/mobx.dart';

part 'login.store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool passwordVisible = false;
  @observable
  bool loading = false;
  @observable
  bool loggedin = false;

  @action
  void setEmail(String value) => email = value;
  @action
  void setPassword(String value) => password = value;
  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;
  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedin = true;

    email = "";
    password = "";
  }

  @action
  void logout(){
    loggedin = false;
  }

  @computed
  bool get isFormValid => email.length > 6 && password.length > 6;
  @computed
  Function get loginPressed => isFormValid && !loading ? login : null;
}
