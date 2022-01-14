import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/domain/errors/home_failure.dart';
import 'package:app_car/app/modules/home/domain/respository/home_repository.dart';
import 'package:app_car/app/modules/home/infra/datasource/home_data_source.dart';
import 'package:app_car/app/modules/home/infra/models/result_search_cars_models.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<Either<HomeFailure, List<ResultSearchCarsModels>>> searchCars(
      String token) async {
    List<ResultSearchCarsModels> listResulSearch;
    try {
      listResulSearch = await homeDataSource.fetchCars(token);
    } catch (e) {
      return left(HomeDataSourceError());
    }
    if (listResulSearch == null) {
      return left(HomeDataSourceNullErro());
    } else {
      return right(listResulSearch);
    }
  }
}
