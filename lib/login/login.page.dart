import 'dart:convert';
import 'package:lista_de_gastos/constants/preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_gastos/login/login_services.dart';
import 'package:lista_de_gastos/login/reset-password.dart';
import 'package:lista_de_gastos/models/user_model.dart';
import 'package:lista_de_gastos/screens/transferencias/lista.dart';
import 'package:lista_de_gastos/sign_up/sign_up_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _mailImputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _mailImputController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordInputController,
              //autofocus: true,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  stops: [0, 10],
                  colors: [
                    Color(0XFFF96C3EB),
                    Color(0XFFF14AAF5),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("images/iconeLista.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () => { _doSignUp(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaTransferencias(),
                      ),
                    )
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: FlatButton(
                  child: Text(
                    "Cadastrar-se",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    _doSignUp();
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      SignUpService().signUp(
        _mailImputController.text,
        _passwordInputController.text,
      );
    } else {
      print("invalido");
    // User newUser = User(
    //   mail: _mailImputController.text,
    //   password: _passwordInputController.text,
    //   keepOn: true,
    // );
    //
    // print(newUser);
    // _saveUser(newUser);
  }

  void _saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("LOGGIN_USER_INFOS", json.encode(user.toJson()));
  }

  void _doLogin() async {
    String mailForm = this._mailImputController.text;
    String passForm = this._passwordInputController.text;



      if (_formKey.currentState!.validate()) {
        LoginService()
            .login(_mailImputController.text, _passwordInputController.text);
      } else {
        print("invalido");
  }

  Future<User> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = prefs.getString( PreferencesKeys.activeUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser);
    User  user = User.fromJson(mapUser);
    return user;

    User  savedUser = await _getSavedUser();
  }
}
}
}

