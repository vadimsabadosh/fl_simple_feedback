// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  final int good;
  final int bad;
  final int neutral;
  final int total;
  final int positivePercentage;

  const Statistics({
    Key? key,
    required this.good,
    required this.bad,
    required this.neutral,
    required this.total,
    required this.positivePercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good: $good',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Neutral: $neutral',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Bad: $bad',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Total: $total',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Positive percentage: $positivePercentage%',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
