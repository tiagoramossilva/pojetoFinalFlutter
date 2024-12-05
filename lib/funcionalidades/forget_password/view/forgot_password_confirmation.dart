import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_white.dart';
import 'package:flutter_application_1/componentes/confirmation_component.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordConfirmation extends StatelessWidget {
  const ForgotPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Define o plano de fundo como preto
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ConfirmationComponent(
              title: 'E-mail enviado com sucesso!',
              description:
                  'Confira seu e-mail e modifique sua senha de acesso ao aplicativo',
            ),
            const Spacer(),
            CustomWhiteButton(
              text: "Confirmar",
              onPressed: () => context.goNamed('sign-in'),
            ),
          ],
        ),
      ),
    );
  }
}
