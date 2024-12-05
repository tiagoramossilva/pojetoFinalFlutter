import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import necessário para kDebugMode
import 'package:flutter_application_1/componentes/event_card.dart';
import 'package:flutter_application_1/componentes/input_field_search.dart';
import 'package:flutter_application_1/funcionalidades/models/event_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                "Filtros",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Categorias",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Datas",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Localização",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho com filtro e título
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.filter_alt,
                      size: 30,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  const Text(
                    "Agenda+",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Saudação ao usuário
              const Text(
                'Olá, Stefani Lemos!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
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
              // Lista horizontal - Categoria: Eventos em Destaque
              const Text(
                "Eventos em Destaque",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180, // Altura fixa para os cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredEvents.length,
                  itemBuilder: (context, index) {
                    final event = featuredEvents[index];
                    return EventCard(
                      image: event["image"]!,
                      title: event["title"]!,
                      city: event["city"]!,
                      uf: event["uf"]!,
                      weekday: event["weekday"]!,
                      date: event["date"]!,
                      time: event["time"]!,
                      category: "Destaque",
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Lista horizontal - Categoria: Festas e Shows
              const Text(
                "Festas e Shows",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180, // Altura fixa para os cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: musicEvents.length,
                  itemBuilder: (context, index) {
                    final event = musicEvents[index];
                    return EventCard(
                      image: event["image"]!,
                      title: event["title"]!,
                      city: event["city"]!,
                      uf: event["uf"]!,
                      weekday: event["weekday"]!,
                      date: event["date"]!,
                      time: event["time"]!,
                      category: "Música",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
