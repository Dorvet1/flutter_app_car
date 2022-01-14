import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/domain/respository/home_repository.dart';
import 'package:app_car/app/modules/home/domain/usecases/search_car_use_case.dart';
import 'package:app_car/app/modules/home/external/home_data_source_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RepositoryMock extends Mock implements HomeRepository {}

main() {
  final repository = RepositoryMock();
  final homeUseCase = SearchCarUseCaseImpl(repository);

  test('Deve retornar um caso de uso', () async {
    when(homeUseCase(any)).thenAnswer((_) async => Right(<ResultSearchCar>[]));
    final result = await repository.searchCars('');
    expect(result | null, isA<List<ResultSearchCar>>());
  });
}
