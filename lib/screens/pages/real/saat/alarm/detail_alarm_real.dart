import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'alarm_sub/alarm_service.dart';
import 'alarm_sub/alarm_checker.dart';
import 'alarm_sub/alarm_list.dart';
import 'alarm_sub/alarm_page.dart';

class DetailAlarmRealPage extends StatefulWidget {
  const DetailAlarmRealPage({super.key});

  @override
  State<DetailAlarmRealPage> createState() => _DetailAlarmRealPageState();
}

class _DetailAlarmRealPageState extends State<DetailAlarmRealPage> {
  final List<TimeOfDay> _alarms = [];
  final AudioPlayer _player = AudioPlayer();
  late Timer _timer;
  TimeOfDay _currentTime = TimeOfDay.now();
  bool _isAlarmPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadAlarms();

    // Dinamik saat güncelleme
    Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _currentTime = TimeOfDay.now();
      });
    });

    // Alarm kontrolü (her 10 saniyede bir)
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      checkAlarms(
        alarms: _alarms,
        now: TimeOfDay.now(),
        isPlaying: _isAlarmPlaying,
        onStart: () => setState(() => _isAlarmPlaying = true),
        onStop: () => setState(() => _isAlarmPlaying = false),
        player: _player,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _player.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _alarms.add(picked);
        _alarms.sort((a, b) => (a.hour * 60 + a.minute).compareTo(b.hour * 60 + b.minute));
      });
      saveAlarms(_alarms);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Alarm ayarlandı: ${picked.format(context)}")),
      );
    }
  }

  Future<void> _loadAlarms() async {
    final loadedAlarms = await loadAlarms();
    setState(() {
      _alarms.clear();
      _alarms.addAll(loadedAlarms);
    });
  }

  void _deleteAlarm(int index) {
    setState(() {
      _alarms.removeAt(index);
    });
    saveAlarms(_alarms);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A40),
      appBar: AppBar(
        title: const Text('Alarm'),
        backgroundColor: const Color(0xFF3D348B),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                _currentTime.format(context),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          AlarmPageUI(
            currentTime: _currentTime,
            onAddPressed: _pickTime,
          ),
          Expanded(
            child: AlarmListUI(
              alarms: _alarms,
              onDelete: _deleteAlarm,
            ),
          ),
        ],
      ),
    );
  }
}
