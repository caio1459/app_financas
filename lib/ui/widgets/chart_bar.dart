import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double value;
  final String label;
  final double percentege;

  const ChartBar({
    super.key,
    required this.value,
    required this.label,
    required this.percentege,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Ajusta o tamanho do texto conforme necessário
        FittedBox(
          child: Text(value.toStringAsFixed(2)),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 60,
          width: 15,
          //Permite colocar um componente sobre o outro
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              //Fator de crescimento com base na porcentagem
              FractionallySizedBox(
                heightFactor: percentege > 0 ? percentege : 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
