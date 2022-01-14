import 'package:app_car/app/modules/home/infra/models/result_search_cars_models.dart';
import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';

import 'package:app_car/app/modules/login/infra/models/login_paramns_models.dart';

abstract class LoginDataSource {
  Future<LoginPostParamnsModels> searchLoginDataSource(
      LoginValidationCredentials validation);

}
