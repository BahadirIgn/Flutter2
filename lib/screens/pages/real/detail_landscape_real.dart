import 'package:flutter/material.dart';

class DetailLandscapeRealPage extends StatelessWidget {
  const DetailLandscapeRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: const Text('Landscape Detail'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'This is the Landscape real detail page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
