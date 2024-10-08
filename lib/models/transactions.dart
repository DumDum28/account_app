class Transactions {
  final int? keyID;
  final String type;
  final String brand;
  final String model;
  final double size;
  final double amount;
  final DateTime date;

  Transactions({
    this.keyID,
    required this.type,
    required this.brand,
    required this.model,
    required this.size,
    required this.amount,
    required this.date,
  });
}
