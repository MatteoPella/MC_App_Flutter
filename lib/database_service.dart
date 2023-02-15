import 'package:nuova_prova_1/squadra.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'MobileComputing_App_Flutter_database.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 5,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store squadre
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {squadre} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE squadre(id INTEGER PRIMARY KEY, nome TEXT, punteggio INTEGER)',
    );
  }

  // Define a function that inserts squadre into the database
  Future<void> insertSquadra(Squadra squadra) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Squadra into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same squadra is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'squadre',
      squadra.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  // A method that retrieves all the squadre from the squadre table.
  Future<List<Squadra>> squadre() async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Query the table for all the squadre.
    final List<Map<String, dynamic>> maps = await db.query('squadre');

    // Convert the List<Map<String, dynamic> into a List<Squadra>.
    return List.generate(maps.length, (index) => Squadra.fromMap(maps[index]));
  }

  Future<Squadra> squadra(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('squadre', where: 'id = ?', whereArgs: [id]);
    return Squadra.fromMap(maps[0]);
  }


  // A method that updates a squadra data from the squadre table.
  Future<void> updateSquadra(Squadra squadra) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given squadra
    await db.update(
      'squadre',
      squadra.toMap(),
      // Ensure that the Squadra has a matching id.
      where: 'id = ?',
      // Pass the Squadra's id as a whereArg to prevent SQL injection.
      whereArgs: [squadra.id],
    );
  }


  // A method that deletes a squadra data from the squadre table.
  Future<void> deleteSquadra(int id) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the Squadra from the database.
    await db.delete(
      'squadre',
      // Use a `where` clause to delete a specific squadra.
      where: 'id = ?',
      // Pass the Squadra's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

}
