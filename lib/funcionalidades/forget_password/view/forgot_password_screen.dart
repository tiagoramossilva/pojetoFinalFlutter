import 'package:flutter/material.dart';

import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:go_router/go_router.dart';
import '../../../componentes/input_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recuperação de senha',
          style: TextStyle(
            fontSize: 26, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Negrito
          ),
        ),
        centerTitle: true, // Centraliza o título no AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinha os widgets ao topo
          children: [
            const SizedBox(
                height: 40), // Espaçamento entre o texto e o campo de entrada
            const InputField(
              label: 'Digite seu endereço de e-mail para recuperação de senha',
              hint: 'Insira seu e-mail',
            ),
            const Spacer(),
            CustomBlackButton(
              text: "Confirmar",
              onPressed: () => context.goNamed('forget-password-confirmation'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.goNamed('sign-in'),
                  style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all(Colors.transparent)),
                  child: const Text('Sair'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
