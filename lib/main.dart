import 'package:flutter/material.dart';
import 'package:lista_de_gastos/login/login.page.dart';


void main() => runApp(Listadegastos());



class Listadegastos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[500],
        accentColor: Colors.lightBlueAccent[100],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.lightBlueAccent[100],
            textTheme: ButtonTextTheme.primary),
      ),
      home: LoginPage(),
    );
  }
}





