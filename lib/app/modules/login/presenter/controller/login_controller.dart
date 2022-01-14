import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';
import 'package:app_car/app/modules/login/domain/usecase/login_paramns_use_case.dart';
import 'package:app_car/app/modules/home/domain/usecases/search_car_use_case.dart';
import 'package:app_car/app/modules/login/presenter/state/login_state.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  LoginUseCaseParamns loginUseCaseParamns;

  LoginControllerBase(
    this.loginUseCaseParamns,
  );
  @observable
  LoginState loginState = StartLoginState();
  @action
  _changeState(LoginState state) => loginState = state;
  makeLogin(LoginValidationCredentials validation) async {
    if (validation.validate()) {
      _changeState(LoadingLoginState(true));
      final result = await loginUseCaseParamns(validation);
      result.fold((l) => _changeState(LoginErroState(l)),
          (r) => _changeState(LoginParamnsSucessState(r)));
    } else {
      _changeState(LoginFailedValidation('Credencias erradas'));
    }
  }
}
