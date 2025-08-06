import 'package:flutter/material.dart';

class DetailHomeRealPage extends StatelessWidget {
  const DetailHomeRealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor:Colors.red,
        title: const Text('Gerçek Home Sayfası'),
      ),
      body: const Center(
        child: Text(
          'İşte burası gerçek içerik!',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }
}
