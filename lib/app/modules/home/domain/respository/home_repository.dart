import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/domain/errors/home_failure.dart';

import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<HomeFailure, List<ResultSearchCar>>> searchCars(String token);
}
