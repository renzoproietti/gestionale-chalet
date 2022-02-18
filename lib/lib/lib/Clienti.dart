class Clienti {
  final int id;
  final String nome;

  static final columns = ["id", "name"];
  Clienti(this.id, this.nome);
  factory Clienti.fromMap(Map<String, dynamic> data) {
    return Clienti(
      data['id'],
      data['name'],

    );
  }
  Map<String, dynamic> toMap() => {
    "id": id,
    "name": nome,
  };
}