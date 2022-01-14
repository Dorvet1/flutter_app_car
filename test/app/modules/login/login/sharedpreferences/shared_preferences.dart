import 'package:app_car/app/modules/login/presenter/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  SharedPreferences.setMockInitialValues({});
  sharedPreferences = await SharedPreferences.getInstance();
  test('deve salvar dado em sharedpreference', () async {
    sharedPreferences.setBool('test', true);
    expect(sharedPreferences.getBool('test'), true);
  });
  test('deve limpar os dados ', () async {
    sharedPreferences.clear();
    expect(sharedPreferences.getBool('test'), null);
  });
}
