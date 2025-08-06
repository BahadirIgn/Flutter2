// lib/screens/pages/real/alarm/alarm_service.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveAlarms(List<TimeOfDay> alarms) async {
  final prefs = await SharedPreferences.getInstance();
  final alarmStrings = alarms.map((alarm) => '${alarm.hour}:${alarm.minute}').toList();
  await prefs.setStringList('alarms', alarmStrings);
}

Future<List<TimeOfDay>> loadAlarms() async {
  final prefs = await SharedPreferences.getInstance();
  final alarmStrings = prefs.getStringList('alarms') ?? [];
  return alarmStrings.map((str) {
    final parts = str.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }).toList();
}
