import 'package:calculadora/models/user_model.dart';
import 'package:calculadora/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: "Calculadora de IMC",
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        //home: SignupScreen(),
      ),
    );
  }
}
