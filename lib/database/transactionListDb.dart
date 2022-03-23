// // import '../models/transaction.dart' as newTx;

// // import 'dart:io';

// import 'dart:convert';
// import 'dart:io';

// import 'package:expense_tracker/models/transaction.dart' as tx;
// import 'package:path_provider/path_provider.dart';
// // import 'package:sqflite/sqflite.dart';

// // class DatabaseHelper {
// //   static final DatabaseHelper instance = DatabaseHelper._instance();
// //   static Database? _db = null;
// //   DatabaseHelper._instance();

// //   String transactionTable = "transaction_table";
// //   String colId = "id";
// //   String colTitle = "title";
// //   String colAmount = "amount";
// //   String colDate = "date";

// //   //Now let's create a getter for our class
// //   Future<Database?> get db async {
// //     _db ??= await _initDb();
// //     return _db;
// //   }

// // Future<Database> _initDb() async {
// //   Directory dir = await getApplicationDocumentsDirectory();
// //   String path = dir.path + 'transaction_list.db';
// //   final transactionListDB =
// //       await openDatabase(path, version: 1, onCreate: _createDb);
// //   return transactionListDB;
// // }

// //   Future _createDb(Database db, int version) async {
// //     await db.execute(
// //         'CREATE TABLE $transactionTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDate TEXT, $colAmount INTEGER)');
// //   }

// //   Future<List<Map<String, dynamic>>> getTransactionMapList() async {
// //     Database? db = await this.db;
// //     final List<Map<String, dynamic>> result = await db!.query(transactionTable);
// //     return result;
// //   }

// //   Future<List<newTx.Transaction>> getTransactionList() async {
// //     final List<Map<String, dynamic>> transactionMapList =
// //         await getTransactionMapList();

// //     final List<newTx.Transaction> transactionList = [];

// //     transactionMapList.forEach((transactionMap) {
// //       transactionList.add(newTx.Transaction.fromMap(transactionMap));
// //     });
// //     transactionList.sort((transactionA, transactionB) =>
// //         transactionA.date.compareTo(transactionB.date));

// //     return transactionList;
// //   }

// //   Future<int> insertTransaction(newTx.Transaction transaction) async {
// //     Database? db = await this.db;
// //     final int result = await db!.insert(
// //       transactionTable,
// //       transaction.toMap(),
// //     );
// //     return result;
// //   }

// //   Future<int> updateTransaction(newTx.Transaction transaction) async {
// //     Database? db = await this.db;
// //     final int result = await db!.update(transactionTable, transaction.toMap(),
// //         where: "$colId = ?", whereArgs: [transaction.id]);
// //     return result;
// //   }

// //   Future<int> deleteTransaction(int id) async {
// //     Database? db = await this.db;
// //     final int result = await db!
// //         .delete(transactionTable, where: "$colId = ?", whereArgs: [id]);
// //     return result;
// //   }
// // }

// import 'package:sqflite/sqflite.dart';

// class TransactionDatabase {
//   static final TransactionDatabase instance = TransactionDatabase._init();

//   static Database? _database;

//   TransactionDatabase._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('transactions.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     Directory dbPath = await getApplicationDocumentsDirectory();
//     String path = dbPath.path + filePath;

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
//     const textType = "TEXT NOT NULL";
//     const intType = "INTEGER NOT NULL";

//     await db.execute('''CREATE TABLE ${tx.tableTransactions} (
//         ${tx.TransactionFields.colId} $idType),
//         ${tx.TransactionFields.colTitle} $textType, 
//         ${tx.TransactionFields.colAmount} $intType, 
//         ${tx.TransactionFields.colDate} $textType ''');
//   }

//   Future<tx.Transaction> create(tx.Transaction transaction) async {
//     final db = await instance.database;

//     // final json = transaction.toJson();
//     // final columns =
//     //     "${tx.TransactionFields.colTitle}, ${tx.TransactionFields.colAmount}, ${tx.TransactionFields.colDate}";

//     // final values =
//     //     "${json[tx.TransactionFields.colTitle]}, ${json[tx.TransactionFields.colAmount]}, ${json[tx.TransactionFields.colDate]}";

//     // final id = await db
//     //     .rawInsert("INSERT INTO table_name ($columns) values ($values)");

//     final id = await db.insert(tx.tableTransactions, transaction.toJson());
//     return transaction.copy(id: id);
//   }

//   Future<Object> readTransaction(int id) async {
//     final db = await instance.database;
//     final maps = await db.query(
//       tx.tableTransactions,
//       columns: tx.TransactionFields.values,
//       where: '${tx.TransactionFields.colId} = ?',
//       whereArgs: [id],
//     );
//     if (maps.isNotEmpty) {
//       return tx.Transaction.fromJson(maps.first);
//     } else {
//       return Exception("ID $id not found");
//     }
//   }

//   Future<List<tx.Transaction>> readAllTransaction() async {
//     final db = await instance.database;
//     final orderBy = "${tx.TransactionFields.colDate} ASC";
//     // final result = await db.rawQuery("SELECT *FROM ${tx.tableTransactions} ORDER BY $orderBy")
//     final result = await db.query(tx.tableTransactions, orderBy: orderBy);
//     return result.map((json) => tx.Transaction.fromJson(json)).toList();
//   }

//   Future<int> update(tx.Transaction transaction) async {
//     final db = await instance.database;

//     return db.update(tx.tableTransactions, transaction.toJson(),
//         where: "${tx.TransactionFields.colId} = ?",
//         whereArgs: [transaction.id]);
//   }

//   Future<int> delete(int id) async {
//     final db = await instance.database;

//     return await db.delete(tx.tableTransactions,
//         where: "${tx.TransactionFields.colId} = ?", whereArgs: [id]);
//   }

//   Future close() async {
//     final db = await instance.database;

//     db.close();
//   }
// }
