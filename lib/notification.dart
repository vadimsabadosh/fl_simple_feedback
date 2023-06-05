import 'package:flutter/material.dart';

class NotificationMessage extends StatelessWidget {
  final String message;
  const NotificationMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 20, color: Colors.blue[900]),
      ),
    );
  }
}
