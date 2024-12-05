import 'package:flutter/foundation.dart';

import '../../usuario/model/usuario.dart';

class SignInStateManagement extends ChangeNotifier {
  Usuario? user;

  void entrar(String email, String senha) {
    user = Usuario(email: email, senha: senha);

    if (kDebugMode) {
      print(
          'Este é o usuario logado: ${user?.email}. Esta é a senha salva: ${user?.senha}');
    }

    notifyListeners();
  }

  void createAccount(String nome, String email, String senha) {
    user = Usuario(nome: nome, email: email, senha: senha);

    if (kDebugMode) {
      print(
          'Este é o usuario cadastrado: ${user?.nome}, ${user?.email}, ${user?.senha}');
    }
  }
}
