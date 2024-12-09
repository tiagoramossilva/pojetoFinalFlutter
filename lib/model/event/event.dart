class Event {
  final String id;
  final String image;
  final String title;
  final String city;
  final String uf;
  final String weekday;
  final String date;
  final String time;
  final String category;
  final String organizer;
  final String description;
  final bool registered;

  const Event({
    required this.id,
    required this.image,
    required this.title,
    required this.city,
    required this.uf,
    required this.weekday,
    required this.date,
    required this.time,
    required this.category,
    this.organizer = 'Pamella Silva',
    this.description =
        'Participe deste evento único, cuidadosamente planejado para proporcionar uma experiência enriquecedora e envolvente. Com uma programação diversificada, que inclui palestras inspiradoras, atividades interativas e momentos de networking, este encontro é a oportunidade perfeita para aprender, trocar ideias e se conectar com pessoas que compartilham dos mesmos interesses. Não perca a chance de fazer parte deste momento especial e expandir seus horizontes!',
    this.registered = false,
  });
}
