import 'package:flutter/material.dart';

class GlobalAlertDialog {
  static void showAlertDialogHomePage(BuildContext context, String msg,
      Function() onPressed, String textButton) {
    AlertDialog alert = new AlertDialog(
      title: Text('Carros'),
      content: Text(
        msg,
      ),
      actions: [TextButton(onPressed: onPressed, child: Text(textButton))],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return alert;
        });
  }
}
