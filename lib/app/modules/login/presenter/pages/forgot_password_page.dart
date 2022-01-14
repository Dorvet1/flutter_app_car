import 'package:app_car/app/global/global_alert_dialog.dart';
import 'package:app_car/app/modules/login/presenter/widgets/app_bar_login/app_bar_login.dart';
import 'package:app_car/app/modules/login/presenter/widgets/buttom_widget/buttow_widget.dart';
import 'package:app_car/app/modules/login/presenter/widgets/text_input_widget/text_input_widget.dart';
import 'package:app_car/app/modules/login/presenter/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0XFF006B88),
          ),
          Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppBarLogin(text: 'Esqueci a Senha'),
                    TextWidgetLogin(
                        decoration: TextDecoration.none,
                        text: 'Login/Email *',
                        color: Colors.black),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: TextInputWidget(
                          errorText: null,
                          labelName: null,
                          obscureText: false,
                          onChanged: (value) {}),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LoginButtomWidget(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            textButtom: 'Cancelar',
                            mediaQuery:
                                MediaQuery.of(context).size.width * 0.25,
                            colorTextButtom: Colors.blue,
                            colorButtom: Colors.white,
                            isLoadin: false,
                          ),
                          LoginButtomWidget(
                            onPressed: () {
                              GlobalAlertDialog.showAlertDialogHomePage(
                                  context, 'Não implementado :-)', () {
                                Modular.to.pop();
                                Modular.to.pop();
                              }, 'OK');
                            },
                            textButtom: 'Enviar',
                            mediaQuery:
                                MediaQuery.of(context).size.width * 0.20,
                            colorTextButtom: Colors.white,
                            colorButtom: Colors.indigo.shade700,
                            isLoadin: null,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
