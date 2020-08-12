import 'package:mvc_mvp_mvvm/mvc/user_model.dart';

class LoginRepository {
  Future<bool> doLogin(UserModel model) async {
    await Future.delayed(Duration(seconds: 2));
    return model.email == 'admin' && model.password == 'admin';
  }
}
