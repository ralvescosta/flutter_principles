import 'package:flutter/material.dart';
import 'package:mvc_mvp_mvvm/home_view.dart';
import 'package:mvc_mvp_mvvm/mvvm/login_repository.dart';
import 'package:mvc_mvp_mvvm/mvvm/login_viewmodel.dart';
import 'package:mvc_mvp_mvvm/mvvm/user_model.dart';

class LoginViewMVVM extends StatefulWidget {
  @override
  _LoginViewMVVMState createState() => _LoginViewMVVMState();
}

class _LoginViewMVVMState extends State<LoginViewMVVM> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  UserModel user = UserModel();
  LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel(LoginRepository());
    viewModel.isLoadingOut.listen((isLogin) {
      if (isLogin) {
        _loginSuccess();
      } else {
        _loginError();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }

  _loginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MyHomePage(title: 'Home'),
      ),
    );
  }

  _loginError() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Login Error'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                  ),
                  onSaved: (value) => user.email = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                  ),
                  onSaved: (value) => user.password = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<bool>(
                    stream: viewModel.isLoadingOut,
                    initialData: false,
                    builder: (context, snapshot) {
                      bool isLoading = snapshot.data;
                      return RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('ENTER'),
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  } else {
                                    _formKey.currentState.save();
                                    viewModel.isLoginInput.add(user);
                                  }
                                });
                    })
              ],
            ),
          ),
        ));
  }
}
