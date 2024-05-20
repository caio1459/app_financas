import 'package:app_financas/models/transaction.dart';
import 'package:app_financas/ui/widgets/custom_list.dart';
import 'package:app_financas/ui/widgets/transaction_not_fould.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(int id) deleteTransaction;

  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: transactions.isEmpty
          ? const TransactionNotFound()
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, i) {
                return CustomList(
                  transaction: transactions[i],
                  deleteTransaction: () =>
                      deleteTransaction(transactions[i].id),
                );
              },
            ),
    );
  }
}
