import 'package:flutter/material.dart';

class DetailLightbulbRealPage extends StatelessWidget {
  const DetailLightbulbRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: const Text('Lightbulb Real'),
        backgroundColor: Color.fromARGB(144, 207, 204, 30),
      ),
      body: const Center(
        child: Text(
          'This is the Lightbulb real detail page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
