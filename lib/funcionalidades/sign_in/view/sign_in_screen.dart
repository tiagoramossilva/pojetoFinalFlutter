import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:go_router/go_router.dart';

import '../../../componentes/input_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // const SizedBox(height: 160),
            const Spacer(flex: 2),
            const InputField(
              label: 'Usuário',
              hint: 'Insira seu e-mail',
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InputField(
                  label: 'Senha',
                  hint: 'Digite sua senha',
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => context.goNamed('forget-password'),
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
              onPressed: () => context.goNamed('create-account'),
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
    );
  }
}
