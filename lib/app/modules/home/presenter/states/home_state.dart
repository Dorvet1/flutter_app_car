import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/domain/errors/home_failure.dart';

abstract class HomeState {}

class StartHomeState implements HomeState {
  const StartHomeState();
}

class HomeLoadinState implements HomeState {
  String msg;
  HomeLoadinState(this.msg);
}

class SearchCarsSucess implements HomeState {
  final List<ResultSearchCar> listResultCar;
  SearchCarsSucess(this.listResultCar);
}

class SearchCarErro implements HomeState {
  final HomeFailure failure;
  SearchCarErro(this.failure);
}
