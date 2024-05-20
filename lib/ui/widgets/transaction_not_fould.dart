import 'package:flutter/material.dart';

class TransactionNotFound extends StatelessWidget {
  const TransactionNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Nenhuma transação Cadastrada',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 0,
          ),
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            //Define o tamanho com bas eno elemento pai
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
