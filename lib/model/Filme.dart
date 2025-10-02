class Filme {
  String? titulo;
  String? anoLancamento;
  String? categoria;
  int id = 0;

  Filme(this.titulo, {required this.anoLancamento, required this.categoria});

  Filme.fromMap(Map map) {
    this.id = map[FilmeContrato.idColumn];
    this.titulo = map[FilmeContrato.tituloColumn];
    this.anoLancamento = map[FilmeContrato.anoLancamentoColumn];
    this.categoria = map[FilmeContrato.categoriaColumn];
  }


  Map<String, dynamic> toMap() {
    return {
      FilmeContrato.tituloColumn: this.titulo,
      FilmeContrato.anoLancamentoColumn: this.anoLancamento,
      FilmeContrato.categoriaColumn:this.categoria
    };
  }
}

abstract class FilmeContrato {
  static const filmeTable = "filmes_tbl";
  static const idColumn = "id";
  static const tituloColumn = "titulo_filme";
  static const anoLancamentoColumn = "ano_lancamento";
  static const categoriaColumn = "categoria";

  static const SQL_CREATE =
      "CREATE TABLE ${FilmeContrato.filmeTable} (${FilmeContrato.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "                                 ${FilmeContrato.tituloColumn} TEXT, "
      "                                 ${FilmeContrato.anoLancamentoColumn} TEXT, "
      "                                 ${FilmeContrato.categoriaColumn} TEXT)";
  static const SQL_DROP = "DROP TABLE ${FilmeContrato.filmeTable}";
}
