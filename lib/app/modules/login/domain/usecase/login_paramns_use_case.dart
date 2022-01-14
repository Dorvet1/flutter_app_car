import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';
import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';

import 'package:app_car/app/modules/login/domain/erros/error.dart';
import 'package:app_car/app/modules/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUseCaseParamns {
  Future<Either<LoginFailure, LoginPostParamns>> call(
      LoginValidationCredentials validation);
}

class LoginUseCaseParamnsImpl implements LoginUseCaseParamns {
  LoginRepository repository;
  LoginUseCaseParamnsImpl(this.repository);

  @override
  Future<Either<LoginFailure, LoginPostParamns>> call(
      LoginValidationCredentials validation) async {
    final result = await repository.searchLoginParamns(validation);
    return result;
  }
}
