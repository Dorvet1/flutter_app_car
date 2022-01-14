import 'package:app_car/app/modules/login/infra/repository/login_repository_impl.dart';
import 'package:app_car/app/modules/login/presenter/controller/login_controller.dart';
import 'package:app_car/app/modules/login/presenter/pages/forgot_password_page.dart';
import 'package:app_car/app/modules/login/presenter/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repository/login_repository.dart';
import 'domain/usecase/login_paramns_use_case.dart';
import 'external/login_data_source_impl.dart';
import 'infra/datasource/login_data_source.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LoginUseCaseParamns>(
        (i) => LoginUseCaseParamnsImpl(i())),
    Bind.lazySingleton<LoginRepository>((i) => LoginRepositoryImpl(
          i(),
        )),
    Bind.factory<LoginController>((i) => LoginController(
          i(),
        )),
    Bind.lazySingleton<LoginDataSource>((i) => LoginDataSourceImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/forgotPassword', child: (_, args) => ForgotPasswordPage())
  ];
}
