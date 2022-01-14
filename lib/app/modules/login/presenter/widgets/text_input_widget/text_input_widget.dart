// ignore_for_file: unused_element, prefer_const_constructors

import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final void Function(String) onChanged;
  final String labelName;
  final String errorText;
  final bool obscureText;
  final Icon icon;
  final Function onChangedIconButton;
  const TextInputWidget(
      {Key key,
      @required this.errorText,
      @required this.labelName,
      @required this.obscureText,
      @required this.onChanged,
      @required this.icon,
      @required this.onChangedIconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        autocorrect: true,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: icon == null ? Container() : icon,
            onPressed: onChangedIconButton,
          ),
          labelStyle: TextStyle(color: Colors.grey),
          errorText: errorText,
          hintText: labelName,
        ),
      ),
    );
  }
}
