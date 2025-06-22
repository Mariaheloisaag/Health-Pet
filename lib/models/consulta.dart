class Consulta {
  final int? id;
  final String clinica;
  final String data;
  final String horario;

  Consulta({this.id, required this.clinica, required this.data, required this.horario});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clinica': clinica,
      'data': data,
      'horario': horario,
    };
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    return Consulta(
      id: map['id'],
      clinica: map['clinica'],
      data: map['data'],
      horario: map['horario'],
    );
  }
}
