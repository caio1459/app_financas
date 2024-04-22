import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  final double price;

  const PriceContainer({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        price.toString(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }
}
