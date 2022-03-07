
class Clienti{

  final int id;
  final String nome;
  final String email;
  final int eta;

  Clienti({required this.id, required this.nome, required this.email, required this.eta});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email' : email,
      'eta' : eta,

    };
  }
  factory Clienti.fromMap(Map<String, dynamic> json) => Clienti(
        id: json['id'],
        nome: json['nome'],
        email: json['email'],
        eta: json['eta'],
  );


}