class AccountType {
  final int id;
  final String account;
  final double price;
  final double iva;
  final double fastCashBonus;
  final double discPurchasesCourse;
  final double payInBinary;
  final double profitOnPurchases;
  final double profitOnPurchases2;
  final double comission;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int enrollmentDuration;
  final double discPurchasesCertificates;

  AccountType({
    required this.id,
    required this.account,
    required this.price,
    required this.iva,
    required this.fastCashBonus,
    required this.discPurchasesCourse,
    required this.payInBinary,
    required this.profitOnPurchases,
    required this.profitOnPurchases2,
    required this.comission,
    required this.status,
    this.createdAt,
    this.updatedAt,
    required this.enrollmentDuration,
    required this.discPurchasesCertificates,
  });
}
