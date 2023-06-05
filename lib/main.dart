import 'package:flutter/material.dart';
import 'feedback_options.dart';
import 'statistics.dart';
import 'notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, int> _state = {
    "good": 0,
    "neutral": 0,
    "bad": 0,
  };

  void _onLeaveFeedback(String option) {
    setState(() {
      _state[option] = _state[option]! + 1;
    });
  }

  int countTotalFeedback() {
    return _state["bad"]! + _state["neutral"]! + _state["good"]!;
  }

  int countPositivePercentage() {
    if (countTotalFeedback() > 0) {
      return (_state['good']! / countTotalFeedback() * 100).round();
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Feedback Feature'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please leave feedback',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 50),
            FeedbackOptions(
              options: _state.keys.toList(),
              onLeaveFeedback: _onLeaveFeedback,
            ),
            const SizedBox(height: 50),
            countTotalFeedback() > 0
                ? Statistics(
                    bad: _state["bad"]!,
                    good: _state["good"]!,
                    neutral: _state["neutral"]!,
                    positivePercentage: countPositivePercentage(),
                    total: countTotalFeedback(),
                  )
                : const NotificationMessage(message: 'No feedback yet'),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
