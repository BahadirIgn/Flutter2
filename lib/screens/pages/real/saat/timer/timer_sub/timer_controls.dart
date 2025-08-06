import 'package:flutter/material.dart';

class TimerControls extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onReset;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const TimerControls({
    super.key,
    required this.isRunning,
    required this.onStart,
    required this.onPause,
    required this.onReset,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onDecrease,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16),
            isRunning
                ? ElevatedButton(
                    onPressed: onPause,
                    child: const Text('Duraklat'),
                  )
                : ElevatedButton(
                    onPressed: onStart,
                    child: const Text('Başlat'),
                  ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: onIncrease,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onReset,
          child: const Text('Sıfırla'),
        ),
      ],
    );
  }
}
