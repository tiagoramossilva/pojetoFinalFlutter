import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/funcionalidades/sign_in/view/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/usuario.dart';

class SignInStateManagement extends Cubit<SignInState> {
  SignInStateManagement() : super(const SignInState.inicial());

  Usuario? user;

  void entrar(String email, String senha) {
    String emailUsuarioPermitido = 'a';
    String senhaUsuarioPermitido = 'a';

    if (emailUsuarioPermitido == email && senhaUsuarioPermitido == senha) {
      emit(const SignInState.successo());
    } else {
      emit(const SignInState.erro());
      return;
    }

    user = Usuario(email: email, senha: senha);

    if (kDebugMode) {
      print(
          'Este é o usuario logado: ${user?.email}. Esta é a senha salva: ${user?.senha}');
    }
  }

  void createAccount(String nome, String email, String senha) {
    user = Usuario(nome: nome, email: email, senha: senha);

    if (kDebugMode) {
      print(
          'Este é o usuario cadastrado: ${user?.nome}, ${user?.email}, ${user?.senha}');
    }
  }
}
