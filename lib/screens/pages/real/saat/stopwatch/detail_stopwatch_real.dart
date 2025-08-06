import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pages/real/saat/stopwatch/stopwatch_sub/stopwatch_display.dart';
import 'package:flutter_application_1/screens/pages/real/saat/stopwatch/stopwatch_sub/stopwatch_controls.dart';
import 'package:flutter_application_1/screens/pages/real/saat/stopwatch/stopwatch_sub/stopwatch_laps.dart';
import 'package:flutter_application_1/screens/pages/real/saat/stopwatch/stopwatch_sub/stopwatch_timer.dart';

class DetailStopwatchRealPage extends StatefulWidget {
  const DetailStopwatchRealPage({super.key});

  @override
  State<DetailStopwatchRealPage> createState() => _DetailStopwatchRealPageState();
}

class _DetailStopwatchRealPageState extends State<DetailStopwatchRealPage> {
  late StopwatchTimerService _stopwatchTimer;

  @override
  void initState() {
    super.initState();
    _stopwatchTimer = StopwatchTimerService(onTick: () {
      setState(() {}); // Her tikte arayüzü güncelle
    });
  }

  @override
  void dispose() {
    _stopwatchTimer.stop(); // timer'ı iptal et
    super.dispose();
  }

  void _onStart() => _stopwatchTimer.start();
  void _onStop() => _stopwatchTimer.stop();
  void _onReset() => _stopwatchTimer.reset();
  void _onLap() => _stopwatchTimer.lap();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A40),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D348B),
        title: const Text('Kronometre'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          StopwatchDisplay(elapsed: _stopwatchTimer.currentDuration),
          const SizedBox(height: 24),
          StopwatchControls(
            isRunning: _stopwatchTimer.isRunning,
            onStart: _onStart,
            onStop: _onStop,
            onReset: _onReset,
            onLap: _onLap,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: StopwatchLaps(laps: _stopwatchTimer.laps),
          ),
        ],
      ),
    );
  }
}
