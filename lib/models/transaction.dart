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

  //Now, let's create a function that will turn our data into Map
  //Make sure that the key used here have the same name as the table column
  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'title': title,
      'amount': amount,
      'creationDate': date.toIso8601String()
    });
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction.withId(
        id: map['id'],
        title: map['title'],
        amount: map['amount'],
        date: DateTime.parse(map['date']));
  }
}
