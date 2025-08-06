// lib/screens/pages/real/alarm/alarm_checker.dart

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

Future<void> checkAlarms({
  required List<TimeOfDay> alarms,
  required TimeOfDay now,
  required bool isPlaying,
  required VoidCallback onStart,
  required VoidCallback onStop,
  required AudioPlayer player,
}) async {
  for (var alarm in alarms) {
    if (alarm.hour == now.hour && alarm.minute == now.minute && !isPlaying) {
      onStart();

      await player.play(AssetSource('audio/tropical-alarm-clock-168821.mp3'));
      await Future.delayed(const Duration(seconds: 10));
      await player.stop();

      onStop();
      break;
    }
  }
}
