import 'package:flutter/material.dart';

class LoginPostParamns {
  String image;
  String token;
  String urlFoto;
  LoginPostParamns({@required this.image, @required this.token});

  LoginPostParamns.fromJson(Map<String, dynamic> json) {
    this.image = json['urlFoto'];
    this.token = json['token'];
  }
}
