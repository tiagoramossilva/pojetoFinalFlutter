import 'package:flutter/material.dart';

class ConfirmationComponent extends StatelessWidget {
  const ConfirmationComponent({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 430,
        height: 660, // Altura do quadrado
        padding: const EdgeInsets.all(20), // Espaçamento interno
        decoration: BoxDecoration(
          color: Colors.white, // Fundo branco
          borderRadius: BorderRadius.circular(10), // Bordas arredondadas
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centraliza horizontalmente
          mainAxisSize: MainAxisSize.min, // Ajusta o tamanho ao conteúdo
          children: [
            const Icon(
              Icons.check_circle, // Ícone de confirmação
              color: Colors.black, // Cor do ícone
              size: 80.0, // Tamanho do ícone
            ),
            const SizedBox(height: 20), // Espaçamento entre ícone e título
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), // Espaçamento entre título e descrição
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
