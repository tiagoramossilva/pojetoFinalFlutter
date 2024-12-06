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
        'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos',
    this.registered = false,
  });
}
