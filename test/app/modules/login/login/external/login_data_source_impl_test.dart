import 'dart:convert';

import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';

import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';
import 'package:app_car/app/modules/login/domain/erros/error.dart';

import 'package:app_car/app/modules/login/external/login_data_source_impl.dart';
import 'package:app_car/app/modules/login/infra/models/login_paramns_models.dart';
import 'package:app_car/app/modules/login/presenter/pages/login_page.dart';

import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final loginDataSourceImpl = LoginDataSourceImpl(dio);
  final validation = LoginValidationCredentials();
  validation.setPassword('123');
  validation.setUser('user');
  test('Deve retornar uma lista de carros', () async {
    when(dio.post(any)).thenAnswer((_) async => Response(
          data: {'username': validation.user, 'password': validation.password},
          statusCode: 200,
          requestOptions: null,
        ));

    final result = await loginDataSourceImpl.searchLoginDataSource(validation);

    expect(result, isA<LoginPostParamns>());
  });
}
