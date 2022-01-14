import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';
import 'package:app_car/app/modules/login/domain/erros/error.dart';

import 'package:app_car/app/modules/login/domain/repository/login_repository.dart';
import 'package:app_car/app/modules/login/infra/datasource/login_data_source.dart';
import 'package:app_car/app/modules/login/infra/models/login_paramns_models.dart';

import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl(
    this.loginDataSource,
  );

  @override
  Future<Either<LoginFailure, LoginPostParamnsModels>> searchLoginParamns(
      LoginValidationCredentials validation) async {
    LoginPostParamnsModels loginParamns;

    try {
      loginParamns = await loginDataSource.searchLoginDataSource(validation);
    } catch (e) {
      return left(DataSourceError());
    }
    if (loginParamns == null) {
      return left(DataSourceNullError());
    } else {
      return right(loginParamns);
    }
  }
}
