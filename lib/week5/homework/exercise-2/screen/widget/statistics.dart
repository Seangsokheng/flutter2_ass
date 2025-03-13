import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  final int redTaps;
  final int blueTaps;

  const Statistics({
    super.key,
    required this.redTaps,
    required this.blueTaps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Red Taps: $redTaps', style: TextStyle(fontSize: 24)),
        Text('Blue Taps: $blueTaps', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}