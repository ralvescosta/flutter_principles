import 'dart:async';

import 'package:mvc_mvp_mvvm/mvvm/login_repository.dart';
import 'package:mvc_mvp_mvvm/mvvm/user_model.dart';

class LoginViewModel {
  final _isLoading$ = StreamController<bool>();
  Sink<bool> get isLoadingInput => _isLoading$.sink;
  Stream<bool> get isLoadingOut => _isLoading$.stream;

  final _isLogin$ = StreamController<UserModel>();
  Sink<UserModel> get isLoginInput => _isLogin$.sink;
  Stream<bool> get isLoginOut => _isLogin$.stream.asyncMap(login);

  LoginRepository loginRepository;
  LoginViewModel(this.loginRepository);

  Future<bool> login(UserModel model) async {
    bool isLogin;
    isLoadingInput.add(true);

    try {
      isLogin = await this.loginRepository.doLogin(model);
    } catch (e) {
      isLogin = false;
    }

    isLoadingInput.add(false);
    return isLogin;
  }

  dispose() {
    _isLoading$.close();
    _isLogin$.close();
  }
}
