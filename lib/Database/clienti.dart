
class Clienti{

  final int _id;
  String _nome;
  String _email;
  final int _eta;

  Clienti(this._id, this._nome, this._email, this._eta);
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nome': _nome,
      'email' : _email,
      'eta' : _eta

    };
  }
  Clienti.fromMapObject(Map<String, dynamic> clientiMap)
      : _id = clientiMap['id'],
        _nome = clientiMap['title'],
        _email = clientiMap['email'],
        _eta = clientiMap['eta'];


  @override
  String toString() {
    return 'Clienti{id: $_id, nome: $_nome}';
  }
}