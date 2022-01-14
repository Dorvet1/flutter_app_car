import 'package:flutter/material.dart';

class TextWidgetLogin extends StatelessWidget {
  final String text;
  final Color color;
  final TextDecoration decoration;
  const TextWidgetLogin(
      {@required this.decoration,
      @required this.text,
      @required this.color,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(decoration: decoration, color: color, fontSize: 12),
        ),
      ),
    );
  }
}
