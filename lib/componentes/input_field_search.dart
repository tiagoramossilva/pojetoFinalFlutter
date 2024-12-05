import 'package:flutter/material.dart';

class InputFieldSearch extends StatelessWidget {
  const InputFieldSearch({
    super.key,
    this.onChanged,
  });

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Eventos, produtores e locais",
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
