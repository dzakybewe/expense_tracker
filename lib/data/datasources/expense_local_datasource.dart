import 'package:dot_mobile_test/data/models/expense_model.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseLocalDatasource {
  static final ExpenseLocalDatasource _instance =
      ExpenseLocalDatasource._init();
  static Database? _database;

  ExpenseLocalDatasource._init();

  factory ExpenseLocalDatasource() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb("expense.db");
    return _database!;
  }

  Future<Database> _initDb(String path) async {
    final dbPath = await getDatabasesPath();

    return await openDatabase("$dbPath/$path",
        version: 1, onCreate: (db, version) => _createDb(db, version));
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE expenses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        amount REAL,
        category INTEGER,
        date TEXT
      )
    ''');
  }

  Future<int> addExpense(ExpenseModel expense) async {
    final db = await database;
    return await db.insert("expenses", expense.toJson());
  }

  Future<List<ExpenseModel>> getExpenses() async {
    final db = await database;
    final result = await db.query("expenses");

    return result.map((json) => ExpenseModel.fromJson(json)).toList();
  }

  Future<List<Map<String, dynamic>>> queryExpensesByCategory() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT category, SUM(amount) as totalAmount
      FROM expenses
      GROUP BY category
    ''');

    return result;
  }
}
