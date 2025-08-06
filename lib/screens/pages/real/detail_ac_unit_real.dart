import 'package:flutter/material.dart';

class DetailAcUnitRealPage extends StatelessWidget {
  const DetailAcUnitRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('AC Unit'),
      ),
      body: const Center(
        child: Text(
          'This is the real AC Unit detail page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
