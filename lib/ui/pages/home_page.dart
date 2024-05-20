import 'dart:math';

import 'package:app_financas/models/transaction.dart';
import 'package:app_financas/moock/transaction_bloc.dart';
import 'package:app_financas/ui/widgets/chart.dart';
import 'package:app_financas/ui/widgets/transaction_form.dart';
import 'package:app_financas/ui/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transactionBloc = TransactionMoock();
  late List<Transaction> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = transactionBloc.mock;
  }

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((t) =>
            t.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextInt(100),
      title: title,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.pop(context);
  }

  void _deleteTransaction(int id) {
    setState(() {
      _transactions.removeWhere((t) => t.id == id);
    });
  }

  void _openModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(addTransaction: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        actions: [
          IconButton(
            onPressed: () => _openModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(
              transactions: _transactions,
              deleteTransaction: _deleteTransaction,
            ),
          ],
        ),
      ),
    );
  }
}
