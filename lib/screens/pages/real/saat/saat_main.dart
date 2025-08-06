import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'alarm/detail_alarm_real.dart';
import 'stopwatch/detail_stopwatch_real.dart';
import 'timer/detail_timer_real.dart';

class SaatMainPage extends StatefulWidget {
  const SaatMainPage({super.key});

  @override
  State<SaatMainPage> createState() => _SaatMainPageState();
}

class _SaatMainPageState extends State<SaatMainPage> {
  int _currentIndex = 1; // Başlangıçta ortadaki sayfa (Alarm)

  final List<Widget> _pages = const [
    DetailStopwatchRealPage(),   // 0 - Sol
    DetailAlarmRealPage(),       // 1 - Orta
    DetailTimerRealPage(),       // 2 - Sağ
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF3D348B),
        style: TabStyle.react,
        initialActiveIndex: _currentIndex,
        items: const [
          TabItem(icon: Icons.timer, title: 'Kronometre'),
          TabItem(icon: Icons.alarm, title: 'Alarm'),
          TabItem(icon: Icons.hourglass_bottom, title: 'Zamanlayıcı'),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
