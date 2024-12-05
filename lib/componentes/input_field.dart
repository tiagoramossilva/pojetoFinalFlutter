import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
  });

  final String label;
  final String hint;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          maxLines: 2, // Permite até 2 linhas para o texto do label
          overflow:
              TextOverflow.ellipsis, // Adiciona reticências caso ultrapasse
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200], // Fundo cinza claro para o input
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ), // Padding interno do campo
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Cantos arredondados
              borderSide: BorderSide.none, // Sem bordas visíveis
            ),
          ),
        ),
      ],
    );
  }
}
