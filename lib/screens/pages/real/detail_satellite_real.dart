import 'package:flutter/material.dart';

class DetailSatelliteRealPage extends StatelessWidget {
  const DetailSatelliteRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text('Satellite Detail'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          'This is the Satellite real detail page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
