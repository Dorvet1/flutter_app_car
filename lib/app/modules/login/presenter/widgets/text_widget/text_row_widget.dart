import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TextWidgetRow extends StatelessWidget {
  final void Function(bool) onChanged;
  final void Function() textButtonOnPressed;
  final bool validateCheckBox;
  const TextWidgetRow(
      {Key key,
      @required this.onChanged,
      @required this.validateCheckBox,
      @required this.textButtonOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 12;
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            children: [
              Text(
                'Manter logado',
                style: TextStyle(color: Colors.blue.shade500, fontSize: size),
              ),
              Transform.scale(
                scale: 0.6,
                child: Checkbox(value: validateCheckBox, onChanged: onChanged),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              textButtonOnPressed();
            },
            child: Text(
              'Esqueceu senha',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue.shade500,
                  fontSize: size),
            ),
          ),
        ],
      ),
    ));
  }
}
