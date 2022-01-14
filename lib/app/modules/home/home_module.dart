import 'package:app_car/app/modules/home/domain/usecases/search_car_use_case.dart';
import 'package:app_car/app/modules/home/external/home_data_source_impl.dart';
import 'package:app_car/app/modules/home/infra/datasource/home_data_source.dart';
import 'package:app_car/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:app_car/app/modules/home/presenter/controller/home_controller.dart';
import 'package:app_car/app/modules/home/presenter/page/home_page.dart';
import 'package:app_car/app/modules/home/presenter/page/page_cars_page.dart';
import 'package:app_car/app/modules/home/presenter/page/video_player_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'domain/respository/home_repository.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<HomeDataSource>((i) => HomeDataSourceImpl()),
    Bind.lazySingleton<HomeController>((i) => HomeController(i())),
    Bind.lazySingleton<HomeRepository>((i) => HomeRepositoryImpl(i())),
    Bind.lazySingleton<SearchCarUseCase>((i) => SearchCarUseCaseImpl(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/homepage',
        child: (_, args) => HomePage(
              saveParamns: args.data,
            )),
    ChildRoute('/homepage/pagecars',
        child: (_, args) => PageCars(
              saveParamns: args.data,
            )),
    ChildRoute('/homepage/pagecars/videopage',
        child: (_, args) => VideoPlayPage(
              urlVideo: args.data,
            )),
  ];
}
