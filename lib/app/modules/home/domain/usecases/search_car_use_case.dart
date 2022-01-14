import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/domain/errors/home_failure.dart';
import 'package:app_car/app/modules/home/domain/respository/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchCarUseCase {
  Future<Either<HomeFailure, List<ResultSearchCar>>> call(String token);
}

class SearchCarUseCaseImpl implements SearchCarUseCase {
  HomeRepository repository;
  SearchCarUseCaseImpl(this.repository);

  @override
  Future<Either<HomeFailure, List<ResultSearchCar>>> call(String token) async {
    final result = await repository.searchCars(token);
    return result;
  }
}
