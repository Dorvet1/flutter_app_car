import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/external/home_data_source_impl.dart';
import 'package:app_car/app/modules/home/infra/models/result_search_cars_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final homeDataSource = HomeDataSourceImpl();
  test('Deve retornar uma  lista de carros', () async {
    when(dio.get('')).thenAnswer(
      (realInvocation) async => Response(data: {}, statusCode: 200),
    );
    final result = await homeDataSource.fetchCars(
        'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjQyOTY2NzU4LCJyb2wiOlsiUk9MRV9VU0VSIl19.YZtUVgRlxqDL3chQV93A3BwAerTJ4pglzVjOfGu65gD5Emlu4xry1eaKpjGF-_To1S-zgpBMgv4shZaqE2puAg');
    expect(result, isA<List<ResultSearchCarsModels>>());
  });
  // test('Deve retornar uma exception', () async {
  //   when(dio.get(any))
  //       .thenAnswer((_) async => Response(data: null, statusCode: 401));
  //   final result = await homeDataSource.fetchCars('');

  //   expect(result, throwsA(isA<Exception>()));
  // });
}
