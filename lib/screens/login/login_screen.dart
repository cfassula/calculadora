import 'package:calculadora/blocks/login_bloc.dart';
import 'package:calculadora/screens/home/home-screen.dart';
import 'package:calculadora/screens/login/widget/form_container.dart';
import 'package:calculadora/screens/login/widget/sign_up_button.dart';
import 'package:calculadora/screens/login/widget/stagger_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  final _loginBloc = LoginBloc();

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );

    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=> HomeScreen())
        );
      }
    });
  }
  
  @override 
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 6;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset("images/tickicon.png",
                          width: 150, height: 150, fit: BoxFit.contain),
                    ),
                    FormContainer(loginBloc: _loginBloc,),
                    signUpButtom()
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController.view,
                  loginBloc: _loginBloc,
                ),              
              ],
            )
          ],
        ),
      ),
    );
  }
}
