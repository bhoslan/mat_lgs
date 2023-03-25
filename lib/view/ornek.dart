import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  
  @override
  void initState() {
    super.initState();
  final birthday = DateTime(1967, 10, 12);
  final date2 = DateTime.now();
  }
  
 // int  difference = date2.difference(birthday).inDays;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
