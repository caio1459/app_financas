import 'package:app_financas/models/transaction.dart';

class TransactionMoock {
  final List<Transaction> mock = [
    Transaction(
      id: 1,
      title: 'Cinema',
      value: 12.50,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Transaction(
      id: 2,
      title: 'Gasolina',
      value: 20,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 3,
      title: 'Odonto',
      value: 200,
      date: DateTime.now().subtract(const Duration(days: 30)),
    )
  ];

  void deleteTransaction(int id) {
    mock.removeWhere((t) => t.id == id);
  }
}
