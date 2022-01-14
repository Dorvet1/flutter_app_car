import 'package:flutter/material.dart';

class LoginButtomWidget extends StatelessWidget {
  final String textButtom;
  final double mediaQuery;
  final void Function() onPressed;
  final Color colorTextButtom;
  final Color colorButtom;
  final bool isLoadin;
  const LoginButtomWidget(
      {Key key,
      @required this.onPressed,
      @required this.textButtom,
      @required this.mediaQuery,
      @required this.colorTextButtom,
      @required this.colorButtom,
      @required this.isLoadin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaQuery,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorButtom,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            onPressed();
          },
          // ignore: prefer_const_constructors
          child: isLoadin == true
              ? Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
              : Text(
                  textButtom,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 12,
                    color: colorTextButtom,
                  ),
                ),
        ),
      ),
    );
  }
}
