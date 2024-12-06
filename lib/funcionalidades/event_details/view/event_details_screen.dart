import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/event/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do Evento',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 16.0),
            // Título do evento
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            // Descrição
            const Text(
              "Descrição",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              event.description,
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 16.0),
            // Informações adicionais
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16.0),
                const SizedBox(width: 8.0),
                Text(event.date),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para ação no evento
                },
                child: const Text("Participar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
