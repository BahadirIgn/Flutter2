import 'package:flutter/material.dart';
import 'real/detail_landscape_real.dart';

class DetailLandscapePage extends StatefulWidget {
  const DetailLandscapePage({super.key});

  @override
  State<DetailLandscapePage> createState() => _DetailLandscapePageState();
}

class _DetailLandscapePageState extends State<DetailLandscapePage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geçiş
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailLandscapeRealPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text('Landscape'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero3', // id: 3
          child: Icon(Icons.landscape, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
