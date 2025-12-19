import 'package:gastosappg14/models/gasto_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbAdminGastos {
  Database? myDatabase;
  DbAdminGastos._();
  factory DbAdminGastos() {
    return _instance;
  }
  static final DbAdminGastos _instance = DbAdminGastos._();

  Future<Database?> _checkDatabase() async {
    myDatabase ??= await _initDatabase();
    return myDatabase;
  }

  Future<Database> _initDatabase() async {
    final pathDb = await getDatabasesPath();
    final path = join(pathDb, "gastos.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("""CREATE TABLE GASTOS(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT,
                    price REAL,
                    datetime TEXT,
                    type TEXT
                    )""");
      },
    );
  }

  // INSERCIÓN
  Future<int> insertarGasto(GastoModel gasto) async {
    Database? db = await _checkDatabase();
    int res = await db!.insert("GASTOS", gasto.toDB());
    print(res);
    return res;
  }

  // GET
  Future<List<GastoModel>> obtenerGastos() async {
    Database? db = await _checkDatabase();
    List<Map<String, dynamic>> data = await db!.query("GASTOS");
    List<GastoModel> gastoModelList = data
        .map((e) => GastoModel.fromDB(e))
        .toList();

    print(gastoModelList);
    return gastoModelList;
  }
}
