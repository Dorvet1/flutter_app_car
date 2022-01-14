import 'package:app_car/app/modules/home/domain/errors/home_failure.dart';
import 'package:app_car/app/modules/home/infra/datasource/home_data_source.dart';
import 'package:app_car/app/modules/home/infra/models/result_search_cars_models.dart';
import 'package:app_car/app/modules/home/infra/repository/home_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HomeDataSourceMock extends Mock implements HomeDataSource {}

main() {
  final dataSource = HomeDataSourceMock();
  final repository = HomeRepositoryImpl(dataSource);

  test('Deve retornar um caso de sucesso do repository', () async {
    when(dataSource.fetchCars(any))
        .thenAnswer((_) async => <ResultSearchCarsModels>[]);

    final result = await repository.searchCars('');
    expect(result | null, isA<List<ResultSearchCarsModels>>());
  });
  test('Deve retornar um caso de erro de HomeDataSourceErro', () async {
    when(dataSource.fetchCars(any)).thenThrow(Exception());

    final result = await repository.searchCars('');
    expect(result.fold(id, id), isA<HomeDataSourceError>());
  });
  test('Deve retornar um caso de erro HomeDatSourceNullErro', () async {
    when(dataSource.fetchCars(''))
        .thenAnswer((_) async => <ResultSearchCarsModels>[]);

    final result = await repository.searchCars(null);
    expect(result.fold(id, id), isA<HomeDataSourceNullErro>());
  });
}
