// lib/screens/pages/real/alarm/alarm_page.dart

import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class AlarmPageUI extends StatelessWidget {
  final TimeOfDay currentTime;
  final VoidCallback onAddPressed;

  const AlarmPageUI({
    super.key,
    required this.currentTime,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: AnalogClock(
              decoration: BoxDecoration(
                border: Border.all(width: 4.0, color: Colors.white),
                shape: BoxShape.circle,
              ),
              width: 250.0,
              height: 250.0,
              isLive: true,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white70,
              showSecondHand: true,
              secondHandColor: Colors.red,
              numberColor: Colors.white,
              showNumbers: true,
              showAllNumbers: true,
              textScaleFactor: 1.4,
              showTicks: true,
              showDigitalClock: false,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                "Kurulu Alarmlar",
                style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              IconButton(
                onPressed: onAddPressed,
                icon: const Icon(Icons.alarm_add, color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
