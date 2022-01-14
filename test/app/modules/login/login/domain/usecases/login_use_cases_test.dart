import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';

import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';
import 'package:app_car/app/modules/login/domain/erros/error.dart';
import 'package:app_car/app/modules/login/domain/repository/login_repository.dart';
import 'package:app_car/app/modules/login/domain/usecase/login_paramns_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RepositoryMock extends Mock implements LoginRepository {}

main() {
  final repository = RepositoryMock();
  final loginUseCaseImpl = LoginUseCaseParamnsImpl(repository);
  final loginValidation = LoginValidationCredentials();
  test('Deve retornar um usecase ', () async {
    when(loginUseCaseImpl(loginValidation))
        .thenAnswer((_) async => Right(LoginPostParamns(image: '', token: '')));

    final result = await repository.searchLoginParamns(loginValidation);
    expect(result | null, isA<LoginPostParamns>());
  });
}
