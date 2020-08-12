import 'package:flutter/material.dart';
import 'package:mvc_mvp_mvvm/home_view.dart';
import 'package:mvc_mvp_mvvm/mvc/login_repository.dart';
import 'package:mvc_mvp_mvvm/mvp/login_presenter.dart';

class LoginViewMVP extends StatefulWidget {
  @override
  _LoginViewMVPState createState() => _LoginViewMVPState();
}

class _LoginViewMVPState extends State<LoginViewMVP>
    implements LoginViewContract {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginPresenter presenter;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(LoginRepository(), this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  loginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MyHomePage(title: 'Home'),
      ),
    );
  }

  @override
  loginError() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Login Error'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  loginManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: presenter.formKey,
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
                  onSaved: presenter.userEmail,
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
                  onSaved: presenter.userPassword,
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
                  onPressed: presenter.isLoading ? null : presenter.login,
                )
              ],
            ),
          ),
        ));
  }
}
