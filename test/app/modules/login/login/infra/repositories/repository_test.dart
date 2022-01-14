import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';
import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';

import 'package:app_car/app/modules/login/domain/erros/error.dart';
import 'package:app_car/app/modules/login/infra/datasource/login_data_source.dart';
import 'package:app_car/app/modules/login/infra/models/login_paramns_models.dart';
import 'package:app_car/app/modules/login/infra/repository/login_repository_impl.dart';
import 'package:app_car/app/modules/login/presenter/state/login_state.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

main() {
  final loginDataSource = LoginDataSourceMock();
  final repository = LoginRepositoryImpl(loginDataSource);
  final loginValidation = LoginValidationCredentials();
  test('deve retornar um caso de sucesso do repository', () async {
    when(loginDataSource.searchLoginDataSource(loginValidation))
        .thenAnswer((_) async => LoginPostParamnsModels(image: '', token: ''));
    final result = await repository.searchLoginParamns(loginValidation);
    expect(result | null, isA<LoginPostParamnsModels>());
  });
  test('deve retornar um caso de falha do repository', () async {
    when(loginDataSource.searchLoginDataSource(loginValidation))
        .thenThrow(Exception());
    final result = await repository.searchLoginParamns(loginValidation);
    expect(result.fold(id, id), isA<DataSourceError>());
  });
  test('deve retornar um caso de falha nullerro', () async {
    when(loginDataSource.searchLoginDataSource(loginValidation))
        .thenAnswer((_) async => LoginPostParamnsModels(image: '', token: ''));
    final result = await repository.searchLoginParamns(null);
    expect(result.fold(id, id), isA<DataSourceNullError>());
  });
}
