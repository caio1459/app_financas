import 'package:app_financas/models/transaction.dart';
import 'package:app_financas/ui/widgets/info_colums.dart';
import 'package:app_financas/ui/widgets/price_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(id: 1, title: 'Cinema', value: 12.50, date: DateTime.now()),
      Transaction(id: 2, title: 'Gasolina', value: 20, date: DateTime.now())
    ];

    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Despesas Pessoais"),
          backgroundColor: Colors.green.shade300,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              child: const Card(
                elevation: 5,
                color: Colors.lightBlue,
                child: Text("Grafico"),
              ),
            ),
            Column(
              children: [
                ...transactions.map((t) {
                  return Card(
                    child: Row(
                      children: [
                        PriceContainer(price: t.value),
                        InfoColums(title: t.title, date: t.date)
                      ],
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
