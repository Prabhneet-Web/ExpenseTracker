// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
import '../models/transaction.dart' as newTx;

// class DBProvider {
//   static final DBProvider dataBase = DBProvider._();
//   static Database? _database;
//   DBProvider._(); //Creating the constructor of the Class

//   //Now let's create a getter for our class
//   Future<Database?> get database async {
//     //we check if we already have a db
//     if (_database != null) return _database;
//     //else we'll create a new db
//     _database = await initDataBase(); //We'll build this function
//     return _database;
//   }

//   //Creating the db initializer
//   initDataBase() async {
//     return await openDatabase(
//         join(await getDatabasesPath(), "expenses_tracker_db.db"),
//         onCreate: (db, version) async {
//       //We'll create a SQL request to create a table for our transaction
//       await db.execute('''
// CREATE TABLE Transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, amount INT, creationDate TEXT)'''); //This function will execute any sql request
//     }, version: 1);
//   }

//   //Adding a new tx
//   addNewTransaction(newTx.Transaction newTransaction) async {
//     final db = await database;
//     db?.insert("Transactions", newTransaction.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   //Getting the tasks from DB
//   Future<dynamic> getTx() async {
//     final db = await database;
//     var res = await db?.query("Transactions");
//     if (res?.length == 0) {
//       return Null;
//     } else {
//       var resultMap = res?.toList();
//       return resultMap!.isNotEmpty ? resultMap : Null;
//     }
//   }
// }

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db = null;
  DatabaseHelper._instance();

  String transactionTable = "transaction_table";
  String colId = "id";
  String colTitle = "title";
  String colAmount = "amount";
  String colDate = "date";

  //Now let's create a getter for our class
  Future<Database?> get db async {
    _db ??= await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'transaction_list.db';
    final transactionListDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionListDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $transactionTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT, $colAmount INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getTransactionMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(transactionTable);
    return result;
  }

  Future<List<newTx.Transaction>> getTransactionList() async {
    final List<Map<String, dynamic>> transactionMapList =
        await getTransactionMapList();

    final List<newTx.Transaction> transactionList = [];

    transactionMapList.forEach((transactionMap) {
      transactionList.add(newTx.Transaction.fromMap(transactionMap));
    });
    transactionList.sort((transactionA, transactionB) =>
        transactionA.date.compareTo(transactionB.date));

    return transactionList;
  }

  Future<int> insertTransaction(newTx.Transaction transaction) async {
    Database? db = await this.db;
    final int result = await db!.insert(
      transactionTable,
      transaction.toMap(),
    );
    return result;
  }

  Future<int> updateTransaction(newTx.Transaction transaction) async {
    Database? db = await this.db;
    final int result = await db!.update(transactionTable, transaction.toMap(),
        where: "$colId = ?", whereArgs: [transaction.id]);
    return result;
  }

  Future<int> deleteTransaction(int id) async {
    Database? db = await this.db;
    final int result = await db!
        .delete(transactionTable, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
