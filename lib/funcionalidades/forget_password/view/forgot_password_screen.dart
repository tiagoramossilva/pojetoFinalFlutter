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
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
