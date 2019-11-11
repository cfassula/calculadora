import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calcular/validators/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase with LoginValidators{
  
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePassword);

  Stream<bool> get outSubmitVaklid => Observable.combineLatest2(
    outEmail, outPassword, (a,b) => true
    );

  static get outsubmitted => null;


  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

}