import 'package:app_financas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomList extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback deleteTransaction;

  const CustomList({
    super.key,
    required this.transaction,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                'R\$${transaction.value}',
                style: const TextStyle(color: Colors.yellowAccent),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
        ),
        trailing: IconButton(
          onPressed: deleteTransaction,
          icon: const Icon(Icons.delete),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
