// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FeedbackOptions extends StatelessWidget {
  final List<String> options;
  final void Function(String value) onLeaveFeedback;

  const FeedbackOptions({
    Key? key,
    required this.options,
    required this.onLeaveFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: options.map((option) {
          return ElevatedButton(
            onPressed: () {
              onLeaveFeedback(option);
            },
            child: Text(
              option.toCapitalize(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }).toList());
  }
}

extension StringCasingExtension on String {
  String toCapitalize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
