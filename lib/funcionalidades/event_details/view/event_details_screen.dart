import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/button_black.dart';
import 'package:flutter_application_1/model/event/event.dart';
import 'package:go_router/go_router.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

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
                'Detalhes do Evento',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20),
            // Imagem do evento
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                event.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180.0,
              ),
            ),
            const SizedBox(height: 20),
            // Título do evento
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

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
              "Descrição",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              event.description,
              style: const TextStyle(fontSize: 14.0),
            ),
            const Spacer(),
            Center(
              child: CustomBlackButton(
                text: "Inscrever-se",
                onPressed: () =>
                    context.goNamed('event-subscription', extra: event),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
