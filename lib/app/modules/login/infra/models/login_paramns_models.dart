import 'package:app_car/app/modules/login/domain/entities/login_post_paramns.dart';
import 'package:flutter/material.dart';

class LoginPostParamnsModels extends LoginPostParamns {
  String image;
  String token;
  String urlFoto;
  LoginPostParamnsModels({@required this.image, @required this.token});
  LoginPostParamnsModels.fromJson(Map<String, dynamic> json) {
    this.image = json['urlFoto'];
    this.token = json['token'];
  }
}
