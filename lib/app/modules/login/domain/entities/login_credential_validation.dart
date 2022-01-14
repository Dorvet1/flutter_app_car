import 'package:mobx/mobx.dart';
part 'login_credential_validation.g.dart';

class LoginValidationCredentials = LoginValidationCredentialsBase
    with _$LoginValidationCredentials;

abstract class LoginValidationCredentialsBase with Store {
  @observable
  String user;
  @action
  setUser(String value) => user = value;
  @observable
  String password;
  @action
  setPassword(String value) => password = value;
  @observable
  String userErro;
  @action
  setUserError() => this.userErro = null;
  @observable
  String passwordErro;
  @action
  setNullPasswordErro() => this.passwordErro = null;

  clear() {
    user = '';
    password = '';
  }

  bool _validateUser() {
    if (user.isEmpty) {
      userErro = 'Insira seu login';
      return false;
    } else {
      return true;
    }
  }

  bool _validatePassword() {
    if (password.isEmpty) {
      passwordErro = 'Insira sua senha';
      return false;
    }
    if (password.length < 3) {
      passwordErro = 'A Senha precisa ter pelo menos 3 números ';
      return false;
    } else {
      return true;
    }
  }

  bool validate() {
    return _validatePassword() & _validateUser();
  }
}
