import 'dart:async';

class SignUpValidators {
  final validateNome =
      StreamTransformer<String, String>.fromHandlers(handleData: (nome, sink) {
    if (nome != "") {
      sink.add(nome);
    } else {
      sink.addError("Insira o nome!");
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Insira um e-mail válido!");
    }
  });
  
  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError("Insira uma senha válida!");
    }
  });
}
