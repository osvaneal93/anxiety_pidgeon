class Note {
  final int id;
  final String titulo;
  final String registro;

  Note({this.id, this.titulo, this.registro});
  Map<String, dynamic> toMap() {
    return {
      "titulo": this.titulo,
      "registro": this.registro,
    };
  }
}
