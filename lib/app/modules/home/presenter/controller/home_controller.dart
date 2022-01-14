import 'package:app_car/app/modules/home/domain/usecases/search_car_use_case.dart';
import 'package:app_car/app/modules/home/presenter/states/home_state.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  SearchCarUseCase searchCarUseCase;
  HomeControllerBase(this.searchCarUseCase);

  @observable
  HomeState homeState = StartHomeState();
  @action
  changeState(HomeState state) => homeState = state;

  searchCars(String token) async {
    changeState(HomeLoadinState('Buscando carros'));
    final result = await searchCarUseCase(token);
    result.fold((l) => changeState(SearchCarErro(l)),
        (r) => changeState(SearchCarsSucess(r)));
  }
}
