import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:flutter_application_1/funcionalidades/sign_in/view/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../componentes/input_field.dart';
import '../../sign_in/view/sign_in_state_management.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInStateManagement, SignInState>(
      listener: (context, state) {
        if (state == const SignInStateSuccesso()) {
          context.goNamed('home');
        }
        if (state == const SignInStateErro()) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Usuário ou senha invalidos!')));
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Agenda+',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Spacer(flex: 2),
              InputField(
                  label: 'Usuário',
                  hint: 'Insira seu e-mail',
                  onChanged: (valor) {
                    usuarioController.text = valor;
                  }),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                      label: 'Senha',
                      hint: 'Digite sua senha',
                      obscureText: true,
                      onChanged: (valor) {
                        senhaController.text = valor;
                      }),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.goNamed(
                        'forget-password',
                      ),
                      style: ButtonStyle(
                          overlayColor:
                              WidgetStateProperty.all(Colors.transparent)),
                      child: const Text('Esqueci minha senha'),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 3),
              CustomBlackButton(
                text: "Entrar",
                onPressed: () {
                  Provider.of<SignInStateManagement>(context, listen: false)
                      .entrar(usuarioController.text, senhaController.text);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ainda não possui uma conta?'),
                  TextButton(
                    onPressed: () => context.goNamed('create-account'),
                    style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent)),
                    child: const Text('Clique aqui.'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
