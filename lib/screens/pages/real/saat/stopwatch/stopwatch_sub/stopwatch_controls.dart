import 'package:flutter/material.dart';

class StopwatchControls extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onReset;
  final VoidCallback onLap;
  final bool isRunning;

  const StopwatchControls({
    super.key,
    required this.onStart,
    required this.onStop,
    required this.onReset,
    required this.onLap,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 20,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isRunning ? onStop : onStart,
              style: ElevatedButton.styleFrom(
                backgroundColor: isRunning ? Colors.red : Colors.green,
              ),
              child: Text(isRunning ? 'Dur' : 'Başla'),
            ),
            ElevatedButton(
              onPressed: onReset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text('Sıfırla'),
            ),
            ElevatedButton(
              onPressed: onLap,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Tur'),
            ),
          ],
        ),
      ],
    );
  }
}
