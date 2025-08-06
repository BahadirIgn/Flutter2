import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final Duration time;

  const TimerDisplay({super.key, required this.time});

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(time),
      style: const TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
