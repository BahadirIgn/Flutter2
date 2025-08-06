import 'package:flutter/material.dart';

class StopwatchLaps extends StatelessWidget {
  final List<Duration> laps;

  const StopwatchLaps({super.key, required this.laps});

  String _formatLap(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final milliseconds = (duration.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0');

    return '$minutes:$seconds:$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: laps.isEmpty
          ? const Center(
              child: Text(
                "Henüz tur alınmadı.",
                style: TextStyle(color: Colors.white38),
              ),
            )
          : ListView.builder(
              itemCount: laps.length,
              itemBuilder: (context, index) {
                final lap = laps[index];
                return ListTile(
                  leading: Text(
                    'Tur ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    _formatLap(lap),
                    style: const TextStyle(color: Colors.white70),
                  ),
                );
              },
            ),
    );
  }
}
