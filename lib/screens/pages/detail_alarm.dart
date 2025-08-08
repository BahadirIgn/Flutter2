import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pages/real/saat/saat_main.dart';
// Gerçek içerik sayfası

class DetailAlarmPage extends StatefulWidget {
  const DetailAlarmPage({super.key});

  @override
  State<DetailAlarmPage> createState() => _DetailAlarmPageState();
}

class _DetailAlarmPageState extends State<DetailAlarmPage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geç
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SaatMainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text('Alarm'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero6', // dikkat: id = 6
          child: Icon(Icons.alarm, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
