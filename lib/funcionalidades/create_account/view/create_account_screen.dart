import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:go_router/go_router.dart';

import '../../../componentes/input_field.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const InputField(
                label: 'Nome completo*', hint: 'Insira seu nome completo'),
            const SizedBox(height: 20),
            const InputField(label: 'E-mail*', hint: 'Insira seu e-mail'),
            const SizedBox(height: 20),
            const InputField(label: 'Senha*', hint: 'Insira sua senha'),
            const SizedBox(height: 20),
            const InputField(
                label: 'Confirmação de senha*', hint: 'Confirme sua senha'),
            const Spacer(),
            CustomBlackButton(
              text: "Criar conta",
              onPressed: () => context.goNamed('create-account-confirmation'),
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
