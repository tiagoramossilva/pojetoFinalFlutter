import 'package:flutter/foundation.dart'; // Import necessário para kDebugMode
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/event_card_history.dart';
import 'package:flutter_application_1/componentes/input_field_search.dart';
import 'package:flutter_application_1/funcionalidades/models/event_data.dart';
import 'package:flutter_application_1/model/event/event.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text(
                      "Histórico de Eventos:",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Campo de busca
                InputFieldSearch(
                  onChanged: (value) {
                    if (kDebugMode) {
                      print("Texto digitado: $value");
                    }
                  },
                ),
                const SizedBox(height: 20),
                _buildEventList(eventHistory, "Destaque"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventList(List<Map<String, String>> events, String category) {
    return Column(
      children: List.generate(
        events.length,
        (index) {
          final event = events[index];
          return Column(
            children: [
              EventCardHistory(
                event: Event(
                  image: event["image"]!,
                  title: event["title"]!,
                  city: event["city"]!,
                  uf: event["uf"]!,
                  weekday: event["weekday"]!,
                  date: event["date"]!,
                  time: event["time"]!,
                  category: category,
                  id: '',
                ),
              ),
              const SizedBox(height: 10), // Espaço de 10 entre os cards
            ],
          );
        },
      ),
    );
  }
}
