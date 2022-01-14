import 'dart:convert';

import 'package:app_car/app/modules/home/infra/datasource/home_data_source.dart';
import 'package:app_car/app/modules/home/infra/models/result_search_cars_models.dart';
import 'package:http/http.dart' as http;

class HomeDataSourceImpl implements HomeDataSource {
  String endPoint = 'https://carros-springboot.herokuapp.com/api/v2/carros';
  @override
  Future<List<ResultSearchCarsModels>> fetchCars(String token) async {
    final result = await http.get(Uri.parse(endPoint), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (result != null && result.statusCode == 200) {
      final List<dynamic> data = jsonDecode(result.body);

      return data
          .map((dynamic json) => ResultSearchCarsModels.fromJson(json))
          .toList();
    } else {
      throw Exception();
    }
  }
}
