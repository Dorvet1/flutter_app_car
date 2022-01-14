// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:app_car/app/global/global_alert_dialog.dart';
import 'package:app_car/app/global/global_variables.dart';
import 'package:app_car/app/modules/home/presenter/page/home_page.dart';

import 'package:app_car/app/modules/login/domain/entities/login_credential_validation.dart';
import 'package:app_car/app/modules/login/presenter/controller/login_controller.dart';

import 'package:app_car/app/modules/login/presenter/state/login_state.dart';
import 'package:app_car/app/modules/login/presenter/widgets/app_bar_login/app_bar_login.dart';
import 'package:app_car/app/modules/login/presenter/widgets/buttom_widget/buttow_widget.dart';
import 'package:app_car/app/modules/login/presenter/widgets/text_input_widget/text_input_widget.dart';
import 'package:app_car/app/modules/login/presenter/widgets/text_widget/text_row_widget.dart';
import 'package:app_car/app/modules/login/presenter/widgets/text_widget/text_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

SharedPreferences sharedPreferences;
ReactionDisposer disposer;
LoginController controller = Modular.get<LoginController>();
final loginValidation = LoginValidationCredentials();
double borderRadius = 5;
double sizedBox = 10;
bool validateCheckBox = false;
bool valuePassWordIconButton = true;

bool isLoading = false;

class LoginPageState extends State<LoginPage> {
  void initState() {
    disposer = reaction((_) => controller.loginState, (state) {
      _manageState(state);
    });

    super.initState();
    isLoading = false;
    loginValidation.clear();
    Future.delayed(Duration(milliseconds: 300)).then((_) async {
      sharedPreferences = await SharedPreferences.getInstance();

      if (await sharedPreferences.getBool(GlobalVariable.VALIDATION) == true) {
        loginValidation.setUser(
            await sharedPreferences.getString(GlobalVariable.USER_KEY));
        loginValidation.setPassword(
            await sharedPreferences.getString(GlobalVariable.PASSWORD_KEY));
        await controller.makeLogin(loginValidation);
      } else {
        Modular.initialRoute;
      }
    });
  }

  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/image.jpg')))),
      Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                AppBarLogin(
                  text: 'Carros',
                ),
                TextWidgetLogin(
                  text: 'Login',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                Observer(builder: (_) {
                  return TextInputWidget(
                    errorText: loginValidation.userErro,
                    labelName: 'Digite o login ',
                    obscureText: false,
                    onChanged: (value) {
                      loginValidation.setUserError();
                      loginValidation.setUser(value);
                    },
                    icon: null,
                    onChangedIconButton: () {},
                  );
                }),
                TextWidgetLogin(
                  text: 'Senha',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                Observer(builder: (_) {
                  return TextInputWidget(
                    errorText: loginValidation.passwordErro,
                    labelName: 'Digite a senha',
                    obscureText: valuePassWordIconButton,
                    onChanged: (value) {
                      loginValidation.setNullPasswordErro();
                      loginValidation.setPassword(value);
                    },
                    icon: valuePassWordIconButton == false
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                    onChangedIconButton: () {
                      setState(() {
                        valuePassWordIconButton = !valuePassWordIconButton;
                      });
                    },
                  );
                }),
                TextWidgetRow(
                    onChanged: (value) {
                      setState(() {
                        validateCheckBox = value;
                      });
                    },
                    validateCheckBox: validateCheckBox,
                    textButtonOnPressed: () {
                      Modular.to.pushNamed('forgotPassword');
                    }),
                LoginButtomWidget(
                  onPressed: () {
                    controller.makeLogin(loginValidation);
                  },
                  colorButtom: Colors.indigo.shade700,
                  mediaQuery: width,
                  textButtom: 'Login',
                  colorTextButtom: Colors.white,
                  isLoadin: isLoading,
                ),
                Expanded(
                    child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidgetLogin(
                          decoration: TextDecoration.underline,
                          text: 'Ainda não é cadastrado?',
                          color: Colors.grey.withOpacity(0.4)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Crie uma conta',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue.shade500,
                                fontSize: 12),
                          )),
                    ],
                  ),
                )),
                Expanded(
                    child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidgetLogin(
                          decoration: TextDecoration.underline,
                          text: 'Ajuda',
                          color: Colors.grey.withOpacity(0.4)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            size: 15,
                            color: Colors.indigo.shade700,
                          ))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      )
    ]));
  }

  void _manageState(LoginState state) async {
    if (state is LoadingLoginState) {
      setState(() {
        isLoading = state.isLoading;
      });
    }

    if (state is LoginErroState) {
      GlobalAlertDialog.showAlertDialogHomePage(context, 'Login incorreto', () {
        setState(() {
          isLoading = !isLoading;
        });
        Navigator.of(context).pop();
      }, 'OK');
    }
   

    if (state is LoginParamnsSucessState) {
      await sharedPreferences.setString(
          GlobalVariable.USER_KEY, loginValidation.user);
      await sharedPreferences.setString(
          GlobalVariable.PASSWORD_KEY, loginValidation.password);

      Modular.to.pushReplacementNamed('/homepage',
          arguments: SaveParamns(
              token: state.listLoginParamns.token,
              stayOn: validateCheckBox,
              image: state.listLoginParamns.image));
    }
  }
}
