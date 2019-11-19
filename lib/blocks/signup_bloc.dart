import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculadora/validators/signup_validators.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

class SignUpBloc extends BlocBase with SignUpValidators {
  
  final _nomeController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outNome => _nomeController.stream.transform(validateNome);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePassword);
  Stream<bool> get outSubmitValid => Observable.combineLatest3(
    outNome, outEmail, outPassword, (a,b,c) => true
  );

  Function(String) get changeNome => _nomeController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  
  
  @override
  void dispose() {
    _emailController.close();
  }

}