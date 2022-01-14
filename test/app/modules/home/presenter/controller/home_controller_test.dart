// import 'package:app_car/app/modules/home/domain/usecases/search_car_use_case.dart';
// import 'package:app_car/app/modules/home/presenter/controller/home_controller.dart';
// import 'package:app_car/app/modules/home/presenter/states/home_state.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_modular_test/flutter_modular_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class UseCaseMock extends Mock implements SearchCarUseCase {}

// class DioMock extends Mock implements Dio {}

// main() {
//   final dio = DioMock();
//   final useCase = UseCaseMock();
//   final controller = HomeController(useCase);
//   String token =
//       'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyIiwiZXhwIjoxNjQyOTY2NzU4LCJyb2wiOlsiUk9MRV9VU0VSIl19.YZtUVgRlxqDL3chQV93A3BwAerTJ4pglzVjOfGu65gD5Emlu4xry1eaKpjGF-_To1S-zgpBMgv4shZaqE2puAg';
//   test('Deve retornar true a controladora ', () async {
//     when(dio.get('')).thenAnswer(
//       (realInvocation) async => Response(data: {}, statusCode: 200),
//     );
//     final result = await controller.searchCars(token);
//     expect(controller.homeState is SearchCarsSucess, true);
//   });
// }
