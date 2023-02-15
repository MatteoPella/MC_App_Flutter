import 'dart:convert';

class Squadra {
  final int? id;
  final String nome;
  final int punteggio;

  Squadra({
    this.id,
    required this.nome,
    required this.punteggio,
  });

  // Convert a Squadra into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'punteggio': punteggio,
    };
  }

  factory Squadra.fromMap(Map<String, dynamic> map) {
    return Squadra(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      punteggio: map['punteggio'].toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Squadra.fromJson(String source) => Squadra.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each squadra when using the print statement.
  @override
  String toString() => 'Squadra(id: $id, nome: $nome, punteggio: $punteggio)';
}
