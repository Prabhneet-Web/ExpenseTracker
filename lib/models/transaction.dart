final String tableTransactions = "transaction";

class TransactionFields {
  static final List<String> values = [colId, colTitle, colAmount, colDate];
  static const String colId = "_id";
  static const String colTitle = "title";
  static const String colAmount = "amount";
  static const String colDate = "date";
}

class Transaction {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  Transaction.withId(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});

  Transaction copy({String? id, String? title, int? amount, DateTime? date}) =>
      Transaction(
          id: id ?? this.id,
          title: title ?? this.title,
          amount: amount ?? this.amount,
          date: date ?? this.date);

  //Now, let's create a function that will turn our data into Map
  //Make sure that the key used here have the same name as the table column
  Map<String, dynamic> toJson() {
    return ({
      TransactionFields.colId: id,
      TransactionFields.colTitle: title,
      TransactionFields.colAmount: amount,
      TransactionFields.colDate: date.toIso8601String()
    });
  }

  static Transaction fromJson(Map<String, Object?> json) {
    return Transaction.withId(
        id: json[TransactionFields.colId] as String,
        title: json[TransactionFields.colTitle] as String,
        amount: json[TransactionFields.colAmount] as int,
        date: DateTime.parse(json[TransactionFields.colDate] as String));
  }
}
