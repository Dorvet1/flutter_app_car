import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';
import 'package:app_car/app/modules/login/domain/erros/error.dart';

abstract class LoginState {}

class StartLoginState implements LoginState {
  const StartLoginState();
}

class LoadingLoginState implements LoginState {
  final bool isLoading;
  LoadingLoginState(this.isLoading);
}

class LoginParamnsSucessState implements LoginState {
  final LoginPostParamns listLoginParamns;
  LoginParamnsSucessState(this.listLoginParamns);
}

class LoginErroState implements LoginState {
  final LoginFailure failure;
  LoginErroState(this.failure);
}

class LoginFailedValidation implements LoginState {
  final String msg;
  LoginFailedValidation(this.msg);
}
