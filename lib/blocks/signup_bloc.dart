import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calculadora/validators/signup_validators.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState {IDLE, LOADING, SUCCESS, FAIL}

class SignUpBloc extends BlocBase with SignUpValidators {
  
  final _emailController = BehaviorSubject<String>();
  final _nomeController = BehaviorSubject<String>();

  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outNome => _nomeController.stream.transform(validateNome);

  Function(String) get changeEmail => _emailController.sink.add;
  
  
  @override
  void dispose() {
    _emailController.close();
  }

}