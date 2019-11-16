import 'package:calculadora/screens/login/widget/input_field.dart';
import 'package:calculadora/blocks/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormContainer extends StatelessWidget {
  final LoginBloc loginBloc;

  FormContainer({this.loginBloc});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Usuário",
              obscure: false,
              icon: Icons.person_outline,
              stream: loginBloc.outEmail,
              onChanged: loginBloc.changeEmail,
            ),
            InputField(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock_outline,
              stream: loginBloc.outPassword,
              onChanged: loginBloc.changePassword,
            ),
          ],
        ),
      ),
    );
  }

}