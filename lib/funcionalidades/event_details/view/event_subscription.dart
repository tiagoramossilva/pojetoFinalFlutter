import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:flutter_application_1/componentes/input_field.dart';
import 'package:flutter_application_1/model/event/event.dart';
import 'package:go_router/go_router.dart';

class EventSubscription extends StatelessWidget {
  final Event event;
  const EventSubscription({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(), // Empurra o texto para o lado direito
            Text(
              "Agenda+",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Confirmação de inscrição',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Confirme as informações do evento: ",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16.0),
                const SizedBox(width: 8.0),
                Text(event.date),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.lock_clock, size: 16.0),
                const SizedBox(width: 8.0),
                Text(event.time),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.map_sharp, size: 16.0),
                const SizedBox(width: 8.0),
                Text('${event.city}, ${event.uf}'),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.person_2, size: 16.0),
                const SizedBox(width: 8.0),
                Text(event.organizer),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Confirme suas informações: ",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const InputField(
              label: 'Nome completo:',
              hint: 'Insira seu nome completo',
            ),
            const SizedBox(height: 8),
            const InputField(
              label: 'E-mail: ',
              hint: 'Insira seu e-mail',
            ),
            const Spacer(),
            Center(
              child: CustomBlackButton(
                text: "Inscrever-se",
                onPressed: () => context.goNamed('event-confirmation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
