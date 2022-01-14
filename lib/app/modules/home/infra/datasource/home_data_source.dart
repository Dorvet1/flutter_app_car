

import 'package:app_car/app/modules/home/infra/models/result_search_cars_models.dart';

abstract class HomeDataSource {
  Future<List<ResultSearchCarsModels>> fetchCars(String token);
}
