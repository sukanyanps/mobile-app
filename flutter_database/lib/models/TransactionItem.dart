class TransactionItem{
  late int? id;
  String name;
  double amount;
  String benefit;

  TransactionItem({this.id, required this.name, required this.amount, required this.benefit});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'benefit': benefit,
    };
  }
}