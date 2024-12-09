import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/usuario.dart';
import 'package:go_router/go_router.dart'; // Para navegação (para redirecionar ao login)

class UserProfileScreen extends StatefulWidget {
  final Usuario usuario;

  const UserProfileScreen({super.key, required this.usuario});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController birthDateController;
  late TextEditingController cpfController;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.usuario.nome);
    emailController = TextEditingController(text: widget.usuario.email);
    birthDateController =
        TextEditingController(text: widget.usuario.dataNascimento ?? '');
    cpfController = TextEditingController(text: widget.usuario.cpf ?? '');
  }

  void saveChanges() {
    setState(() {
      widget.usuario.setNome(nameController.text);
      widget.usuario.setEmail(emailController.text);
      widget.usuario.setDataNascimento(birthDateController.text);
      widget.usuario.setCpf(cpfController.text);
      isEditing = false;
    });
  }

  void cancelChanges() {
    setState(() {
      nameController.text = widget.usuario.nome;
      emailController.text = widget.usuario.email;
      birthDateController.text = widget.usuario.dataNascimento ?? '';
      cpfController.text = widget.usuario.cpf ?? '';
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agenda+",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Redireciona para a tela de login
              context.goNamed('sign-in');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Minha conta: ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: birthDateController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: cpfController,
              enabled: isEditing,
              decoration: const InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isEditing) ...[
                  ElevatedButton(
                    onPressed: saveChanges,
                    child: const Text("Salvar Alterações"),
                  ),
                  ElevatedButton(
                    onPressed: cancelChanges,
                    child: const Text("Cancelar Alterações"),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = true; // Ativa o modo de edição
                      });
                    },
                    child: const Text("Editar Informações"),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
