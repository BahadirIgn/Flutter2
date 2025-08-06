import 'package:flutter/material.dart';

class DetailPortraitRealPage extends StatelessWidget {
  const DetailPortraitRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: const Text('Portrait Detail'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'This is the Portrait real detail page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
