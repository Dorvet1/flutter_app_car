import 'dart:convert';

import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';

import 'package:app_car/app/modules/login/infra/datasource/login_data_source.dart';
import 'package:app_car/app/modules/login/infra/models/login_paramns_models.dart';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LoginDataSourceImpl implements LoginDataSource {
  final dio = Dio();
  LoginDataSourceImpl(dio);
  String endPoint = 'https://carros-springboot.herokuapp.com/api/v2/login';
  final String endPointCar =
      'https://carros-springboot.herokuapp.com/api/v2/carros';

  @override
  Future<LoginPostParamnsModels> searchLoginDataSource(
      LoginValidationCredentials validation) async {
    var formData = {
      'username': validation.user,
      'password': validation.password
    };
    final result = await dio.post(endPoint, data: formData);

    if (result != null && result.statusCode == 200) {
      final data = jsonEncode(result.data);
      final _data = LoginPostParamnsModels.fromJson(jsonDecode(data));
      return _data;
    } else {
      throw Exception();
    }
  }
}
