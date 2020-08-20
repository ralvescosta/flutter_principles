import 'package:flutter/material.dart';
import 'package:mvc_mvp_mvvm/home_view.dart';
import 'package:mvc_mvp_mvvm/mvc/login_controller.dart';
import 'package:mvc_mvp_mvvm/mvc/login_repository.dart';

class LoginViewMVC extends StatefulWidget {
  @override
  _LoginViewMVCState createState() => _LoginViewMVCState();
}

class _LoginViewMVCState extends State<LoginViewMVC> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = LoginController(LoginRepository());
  }

  @override
  void dispose() {
    super.dispose();
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
          key: controller.formKey,
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
                  onSaved: controller.userEmail,
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
                  onSaved: controller.userPassword,
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
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('ENTER'),
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (await controller.login()) {
                            _loginSuccess();
                          } else {
                            _loginError();
                          }
                          setState(
                            () {
                              isLoading = false;
                            },
                          );
                        },
                )
              ],
            ),
          ),
        ));
  }
}
