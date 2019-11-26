import 'package:calculadora/blocks/signup_bloc.dart';
import 'package:calculadora/screens/signup/widget/form_container.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {

  final _signupBloc = SignUpBloc();
  
  SignupScreen(){
    //Firestore.instance.collection("teste").document("teste").setData({"teste":"teste"});
    //FirebaseAuth.instance.createUserWithEmailAndPassword(email: "cfassula@gmail.com", password: "123456768");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Criar Usuário"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover)
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 32),
                    ),
                    //FormContainer(loginBloc: _loginBloc,),
                    FormContainer(signUpBloc: _signupBloc,),
                    //signUpButtom()
                  ],
                ),
                //StaggerAnimation(
                //  controller: _animationController.view,
                //  loginBloc: _loginBloc,
                //),              
              ],
            )
          ],
        ),
      ),
    );
  }
}