import 'package:flutter/material.dart';
import 'package:mvc_mvp_mvvm/mvc/login_repository.dart';
import 'package:mvc_mvp_mvvm/mvc/user_model.dart';

abstract class LoginViewContract {
  void loginSuccess();
  void loginError();
  void loginManager();
}

class LoginPresenter {
  final formKey = GlobalKey<FormState>();
  final LoginRepository loginRepository;
  final LoginViewContract loginViewContract;
  bool isLoading = false;
  UserModel user = UserModel();

  LoginPresenter(this.loginRepository, this.loginViewContract);

  userEmail(String value) => this.user.email = value;
  userPassword(String value) => this.user.password = value;

  Future login() async {
    bool isLogin;
    isLoading = true;
    this.loginViewContract.loginManager();
    if (!formKey.currentState.validate()) {
      isLogin = false;
    } else {
      formKey.currentState.save();

      try {
        isLogin = await this.loginRepository.doLogin(user);
      } catch (e) {
        isLogin = false;
      }
    }
    isLoading = false;
    this.loginViewContract.loginManager();

    if (isLogin) {
      this.loginViewContract.loginSuccess();
    } else {
      this.loginViewContract.loginError();
    }
  }
}
