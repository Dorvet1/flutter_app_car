import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';

import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';

import 'package:app_car/app/modules/login/domain/erros/error.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, LoginPostParamns>> searchLoginParamns(
      LoginValidationCredentials validation);
}
