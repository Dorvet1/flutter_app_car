

import 'package:app_car/app/modules/home/home_module.dart';
import 'package:app_car/app/modules/login/login_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';



class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio(BaseOptions(
          sendTimeout: 10000,
          connectTimeout: 10000,
          receiveTimeout: 10000,
        )))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/homepage', module: HomeModule())
  ];
}
