import 'package:flutter/material.dart';

class DetailStarRealPage extends StatelessWidget {
  const DetailStarRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: const Text('Star Detail'),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text(
          'This is the Star real detail page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
