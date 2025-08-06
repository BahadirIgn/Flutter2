import 'package:flutter/material.dart';
import 'real/detail_satellite_real.dart';

class DetailSatellitePage extends StatefulWidget {
  const DetailSatellitePage({super.key});

  @override
  State<DetailSatellitePage> createState() => _DetailSatellitePageState();
}

class _DetailSatellitePageState extends State<DetailSatellitePage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geçiş
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailSatelliteRealPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text('Satellite'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero7', // id: 7
          child: Icon(Icons.satellite, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
