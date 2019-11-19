import 'package:calculadora/blocks/signup_bloc.dart';
import 'package:calculadora/screens/signup/widget/input_field.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {

  final SignUpBloc signupBloc;

  FormContainer({this.signupBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
              hint: "Nome Completo",
              obscure: false,
              icon: Icons.person_outline,
              //stream: loginBloc.outEmail,
              //onChanged: loginBloc.changeEmail,
            ),
            InputField(
              hint: "Email",
              obscure: false,
              icon: Icons.email,
              stream: signupBloc.outEmail,
              onChanged: signupBloc.changeEmail,
            ),
            InputField(
              hint: "Senha",
              obscure: true,
              icon: Icons.lock_outline,
//              stream: loginBloc.outPassword,
//              onChanged: loginBloc.changePassword,
            ),
            InputField(
              hint: "Endereço",
              obscure: false,
              icon: Icons.my_location,
//              stream: loginBloc.outPassword,
//              onChanged: loginBloc.changePassword,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: InkWell(
              onTap: () {
                //snapshot.hasData ? controller.forward() : null;
                //snapshot.hasData ? loginBloc.submit : null;
                //controller.forward();
              },
              child: Hero(
                  tag: "fadeLogin",
                  child: Container(
                      width: 320,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 64, 106, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Criar Conta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.3),
                      ),
                      )
                      ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
