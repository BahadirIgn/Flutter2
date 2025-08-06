import 'package:flutter/material.dart';
import 'real/detail_lightbulb_real.dart'; // Gerçek içerik sayfası

class DetailLightbulbPage extends StatefulWidget {
  const DetailLightbulbPage({super.key});

  @override
  State<DetailLightbulbPage> createState() => _DetailLightbulbPageState();
}

class _DetailLightbulbPageState extends State<DetailLightbulbPage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geçiş
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailLightbulbRealPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade700,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        elevation: 0,
        title: const Text('Lightbulb'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero9', // dikkat: id 9
          child: Icon(Icons.lightbulb, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
