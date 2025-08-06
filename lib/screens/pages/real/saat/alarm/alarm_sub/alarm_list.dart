// lib/screens/pages/real/alarm/alarm_list.dart

import 'package:flutter/material.dart';

class AlarmListUI extends StatelessWidget {
  final List<TimeOfDay> alarms;
  final void Function(int index) onDelete;

  const AlarmListUI({
    super.key,
    required this.alarms,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (alarms.isEmpty) {
      return const Center(
        child: Text(
          "Henüz alarm kurulmadı.",
          style: TextStyle(color: Colors.white38, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        final alarm = alarms[index];
        return Card(
          color: Colors.white12,
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const Icon(Icons.alarm, color: Colors.white),
            title: Text(
              alarm.format(context),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () => onDelete(index),
            ),
          ),
        );
      },
    );
  }
}
