import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:go_router/go_router.dart';
import '../../sign_in/view/sign_in_state_management.dart';
import 'package:provider/provider.dart';

import '../../../componentes/input_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController createUserControllerName = TextEditingController();
  TextEditingController createUserControllerEmail = TextEditingController();
  TextEditingController createUserControllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            InputField(
                label: 'Nome completo*',
                hint: 'Insira seu nome completo',
                onChanged: (valor) {
                  createUserControllerName.text = valor;
                }),
            const SizedBox(height: 20),
            InputField(
                label: 'E-mail*',
                hint: 'Insira seu e-mail',
                onChanged: (valor) {
                  createUserControllerEmail.text = valor;
                }),
            const SizedBox(height: 20),
            InputField(
                label: 'Senha*',
                hint: 'Insira sua senha',
                onChanged: (valor) {
                  createUserControllerSenha.text = valor;
                }),
            const SizedBox(height: 20),
            InputField(
                label: 'Confirmação de senha*',
                hint: 'Confirme sua senha',
                onChanged: (valor) {
                  createUserControllerSenha.text = valor;
                }),
            const Spacer(),
            CustomBlackButton(
              text: "Criar conta",
              onPressed: () {
                Provider.of<SignInStateManagement>(context, listen: false)
                    .createAccount(
                  createUserControllerName.text,
                  createUserControllerEmail.text,
                  createUserControllerSenha.text,
                );
                context.goNamed('create-account-confirmation');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Já possui uma conta?'),
                TextButton(
                  onPressed: () => context.goNamed('sign-in'),
                  style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all(Colors.transparent)),
                  child: const Text('Entre aqui.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
