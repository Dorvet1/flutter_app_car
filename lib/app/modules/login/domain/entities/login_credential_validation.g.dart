// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credential_validation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginValidationCredentials on LoginValidationCredentialsBase, Store {
  final _$userAtom = Atom(name: 'LoginValidationCredentialsBase.user');

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$passwordAtom = Atom(name: 'LoginValidationCredentialsBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$userErroAtom = Atom(name: 'LoginValidationCredentialsBase.userErro');

  @override
  String get userErro {
    _$userErroAtom.reportRead();
    return super.userErro;
  }

  @override
  set userErro(String value) {
    _$userErroAtom.reportWrite(value, super.userErro, () {
      super.userErro = value;
    });
  }

  final _$passwordErroAtom =
      Atom(name: 'LoginValidationCredentialsBase.passwordErro');

  @override
  String get passwordErro {
    _$passwordErroAtom.reportRead();
    return super.passwordErro;
  }

  @override
  set passwordErro(String value) {
    _$passwordErroAtom.reportWrite(value, super.passwordErro, () {
      super.passwordErro = value;
    });
  }

  final _$LoginValidationCredentialsBaseActionController =
      ActionController(name: 'LoginValidationCredentialsBase');

  @override
  dynamic setUser(String value) {
    final _$actionInfo = _$LoginValidationCredentialsBaseActionController
        .startAction(name: 'LoginValidationCredentialsBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$LoginValidationCredentialsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$LoginValidationCredentialsBaseActionController
        .startAction(name: 'LoginValidationCredentialsBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginValidationCredentialsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserError() {
    final _$actionInfo = _$LoginValidationCredentialsBaseActionController
        .startAction(name: 'LoginValidationCredentialsBase.setUserError');
    try {
      return super.setUserError();
    } finally {
      _$LoginValidationCredentialsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNullPasswordErro() {
    final _$actionInfo =
        _$LoginValidationCredentialsBaseActionController.startAction(
            name: 'LoginValidationCredentialsBase.setNullPasswordErro');
    try {
      return super.setNullPasswordErro();
    } finally {
      _$LoginValidationCredentialsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
password: ${password},
userErro: ${userErro},
passwordErro: ${passwordErro}
    ''';
  }
}
