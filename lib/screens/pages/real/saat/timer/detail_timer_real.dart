import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pages/real/saat/timer/timer_sub/timer_display.dart';
import 'package:flutter_application_1/screens/pages/real/saat/timer/timer_sub/timer_controls.dart';
import 'package:flutter_application_1/screens/pages/real/saat/timer/timer_sub/timer_service.dart';

class DetailTimerRealPage extends StatefulWidget {
  const DetailTimerRealPage({super.key});

  @override
  State<DetailTimerRealPage> createState() => _DetailTimerRealPageState();
}

class _DetailTimerRealPageState extends State<DetailTimerRealPage> {
  late TimerService _timerService;

  @override
  void initState() {
    super.initState();
    _timerService = TimerService(
      initialDuration: const Duration(minutes: 1), // Başlangıç süresi
      onTick: () {
        setState(() {});
      },
      onComplete: () {
        // Süre bittiğinde yapılacak işlem
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Süre doldu!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tamam'),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  void dispose() {
    _timerService.dispose();
    super.dispose();
  }

  void _onStart() {
    setState(() {
      _timerService.start();
    });
  }

  void _onPause() {
    setState(() {
      _timerService.pause();
    });
  }

  void _onReset() {
    setState(() {
      _timerService.reset();
    });
  }

  void _onIncrease() {
    setState(() {
      _timerService.increaseDuration(const Duration(seconds: 10));
    });
  }

  void _onDecrease() {
    setState(() {
      _timerService.decreaseDuration(const Duration(seconds: 10));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A40),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D348B),
        title: const Text('Zamanlayıcı'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          TimerDisplay(time: _timerService.remainingTime),
          const SizedBox(height: 24),
          TimerControls(
            isRunning: _timerService.isRunning,
            onStart: _onStart,
            onPause: _onPause,
            onReset: _onReset,
            onIncrease: _onIncrease,
            onDecrease: _onDecrease,
          ),
        ],
      ),
    );
  }
}
