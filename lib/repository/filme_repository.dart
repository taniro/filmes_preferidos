import 'package:filmes_preferidos/model/Filme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FilmeRepository {
  //singleton
  //construtor interno
  static final FilmeRepository _instance = FilmeRepository._privateConstructor();

  //criação do factory para retornar a instância
  factory FilmeRepository() => _instance;

  //LivroHelper.instance
  FilmeRepository._privateConstructor(){
    _db = null;
  }

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "filmes.db");

    return await openDatabase(
      path, version: 1,
      onCreate: (Database db, int version) async {
        db.execute(FilmeContrato.SQL_CREATE);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion != newVersion) {
          db.execute(FilmeContrato.SQL_DROP);
          db.execute(FilmeContrato.SQL_CREATE);
        }
      },
    );
  }

  Future<Filme> save(Filme f) async {
    Database? filmedatabase = await db;
    if (filmedatabase != null) {
      f.id = await filmedatabase.insert(FilmeContrato.filmeTable, f.toMap());
    }
    return f;
  }

  //Future<Filme?> get(int id) async {}

  Future<int> delete(int id) async {
    Database? filmedatabase = await db;
    int result = 0;
    if (filmedatabase != null) {
      result = await filmedatabase.delete(FilmeContrato.filmeTable, where: "${FilmeContrato.idColumn} = ?",whereArgs: [id] );
    }
    return result;
  }

  //Future<int> update(Filme l) async {}

  Future<List> getAll() async {
    Database? filmedatabase = await db;
    List<Filme> listFilmes = [];
    if (filmedatabase != null) {
      var filmesMap = await filmedatabase.query(FilmeContrato.filmeTable);
      for (Map m in filmesMap) {
        listFilmes.add(Filme.fromMap(m));
      }
    }
    return listFilmes;
  }
}
