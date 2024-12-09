class Usuario {
  final String senha;
  String nome;
  String email;
  String? dataNascimento;
  String? cpf;

  Usuario({
    this.nome = "",
    required this.email,
    this.senha = "",
    this.dataNascimento,
    this.cpf,
  });

  void setNome(String nome) {
    this.nome = nome;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setDataNascimento(String? dataNascimento) {
    this.dataNascimento = dataNascimento;
  }

  void setCpf(String? cpf) {
    this.cpf = cpf;
  }
}
