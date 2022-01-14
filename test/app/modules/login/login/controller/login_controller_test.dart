// import 'package:app_car/app/app_module.dart';
// import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';

// import 'package:app_car/app/modules/login/login_module.dart';
// import 'package:app_car/app/modules/login/presenter/controller/login_controller.dart';


// import 'package:app_car/app/modules/login/presenter/state/login_state.dart';

// import 'package:dio/dio.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_modular_test/flutter_modular_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class DioMock extends Mock implements Dio {}

// main() {
//   var dio = DioMock();
//   initModule(
//     AppModule(),
//   );

//   initModule(LoginModule());

//   final validation = LoginValidationCredentials();
//   test('Deve retornar true ', () async {
//     LoginController controller = Modular.get<LoginController>();

//     validation.setPassword('user');
//     validation.setUser('123');
//     when(dio.post('')).thenAnswer((_) async => Response(
//         statusCode: 200,
//         data: {'username': validation.user, 'password': validation.password}));
//     await controller.makeLogin(validation);
//     expect(controller.loginState is LoginParamnsSucessState, true);
//   });
// }
