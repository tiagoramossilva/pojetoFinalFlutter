import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_white.dart';
import 'package:flutter_application_1/componentes/confirmation_component.dart';
import 'package:go_router/go_router.dart';

class EventConfirmation extends StatelessWidget {
  const EventConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ConfirmationComponent(
              title: 'Inscrição realizada com sucesso!',
              description:
                  'Confira seu e-ticket no e-mail cadastrado.',
            ),
            const Spacer(),
            CustomWhiteButton(
              text: "Confirmar",
              onPressed: () => context.goNamed('home'),
            ),
          ],
        ),
      ),
    );
  }
}
