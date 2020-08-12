import 'package:flutter/material.dart';
import 'package:mvc_mvp_mvvm/mvc/login_repository.dart';
import 'package:mvc_mvp_mvvm/mvc/user_model.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  LoginRepository loginRepository;

  LoginController(this.loginRepository);

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;

  Future login() async {
    if (!formKey.currentState.validate()) return false;
    formKey.currentState.save();

    try {
      return loginRepository.doLogin(user);
    } catch (e) {
      return false;
    }
  }
}
