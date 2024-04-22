import 'package:flutter/material.dart';

class InfoColums extends StatelessWidget {
  final String title;
  final DateTime date;

  const InfoColums({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          date.toString(),
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
