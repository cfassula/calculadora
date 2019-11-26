import 'package:calculadora/blocks/signup_bloc.dart';
import 'package:calculadora/models/user_model.dart';
import 'package:calculadora/screens/signup/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FormContainer extends StatelessWidget {
  final SignUpBloc signUpBloc;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  FormContainer({this.signUpBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
              if (model.isLoading)
                return Center(child: CircularProgressIndicator(),);
              
          return Form(
            child: Column(
              children: <Widget>[
                InputField(
                  hint: "Nome Completo",
                  obscure: false,
                  icon: Icons.person_outline,
                  stream: signUpBloc.outNome,
                  onChanged: signUpBloc.changeNome,
                  controller: _nameController,
                ),
                InputField(
                  hint: "Email",
                  obscure: false,
                  icon: Icons.email,
                  stream: signUpBloc.outEmail,
                  onChanged: signUpBloc.changeEmail,
                  controller: _emailController,
                ),
                InputField(
                  hint: "Senha",
                  obscure: true,
                  icon: Icons.lock_outline,
                  stream: signUpBloc.outPassword,
                  onChanged: signUpBloc.changePassword,
                  controller: _passwordController,
                ),
                InputField(
                  hint: "Endereço",
                  obscure: false,
                  icon: Icons.my_location,
                  controller: _addressController,
//              stream: loginBloc.outPassword,
//              onChanged: loginBloc.changePassword,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: StreamBuilder(
                      stream: signUpBloc.outSubmitValid,
                      builder: (context, snapshot) {
                        return InkWell(
                          onTap: () {
                            Map<String, dynamic> userData = {
                              "name": _nameController.text,
                              "email": _emailController.text,
                              "address": _addressController.text,
                            };
                            model.signUp(
                              userData: userData, 
                              pass: _passwordController.text, 
                              onSuccess: _onSuccess, 
                              onFail: _onFail

                            );
                            //snapshot.hasData ? controller.forward() : null;
                            //snapshot.hasData ? loginBloc.submit : null;
                            //controller.forward();
                          },
                          child: Hero(
                              tag: "fadeLogin",
                              child: snapshot.hasData
                                  ? Container(
                                      width: 320,
                                      height: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(247, 64, 106, 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Text(
                                        "Criar Conta",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 0.3),
                                      ),
                                    )
                                  : Container(
                                      width: 320,
                                      height: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(247, 64, 106, 1.0)
                                                  .withAlpha(140),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Text(
                                        "Criar Conta",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 0.3),
                                      ),
                                    )),
                        );
                      },
                    ))
              ],
            ),
          );
        }));
  }

  void _onSuccess(){

  }

  void _onFail(){

  }

}
