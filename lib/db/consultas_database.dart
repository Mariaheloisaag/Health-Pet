/*import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_base_page/models/consulta.dart';

class ConsultasDatabase {
  static final ConsultasDatabase instance = ConsultasDatabase._init();
  static Database? _database;

  ConsultasDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('consultas.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE consultas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        clinica TEXT NOT NULL,
        data TEXT NOT NULL,
        horario TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertConsulta(Consulta consulta) async {
    final db = await instance.database;
    await db.insert('consultas', consulta.toMap());
  }

  Future<List<Consulta>> getConsultas() async {
    final db = await instance.database;
    final result = await db.query('consultas');
    return result.map((e) => Consulta.fromMap(e)).toList();
  }

  Future<void> deleteConsulta(int id) async {
    final db = await instance.database;
    await db.delete('consultas', where: 'id = ?', whereArgs: [id]);
  }
}*/

