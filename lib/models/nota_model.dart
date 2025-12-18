class NotaModel {
  final int? id;
  final String titulo;
  final String contenido;

  NotaModel({this.id, required this.titulo, required this.contenido});

  Map<String, dynamic> toMap() {
    return {"id": id, "titulo": titulo, "contenido": contenido};
  }

  factory NotaModel.fromMap(Map<String, dynamic> map) {
    return NotaModel(
      id: map["id"],
      titulo: map["titulo"],
      contenido: map["contenido"],
    );
  }
}
