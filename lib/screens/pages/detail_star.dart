import 'package:flutter/material.dart';
import 'real/detail_star_real.dart';

class DetailStarPage extends StatefulWidget {
  const DetailStarPage({super.key});

  @override
  State<DetailStarPage> createState() => _DetailStarPageState();
}

class _DetailStarPageState extends State<DetailStarPage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geçiş
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailStarRealPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text('Star'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero8', // id: 8
          child: Icon(Icons.star, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
