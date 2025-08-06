import 'package:flutter/material.dart';
import 'real/detail_ac_unit_real.dart'; // Gerçek sayfa

class DetailAcUnitPage extends StatefulWidget {
  const DetailAcUnitPage({super.key});

  @override
  State<DetailAcUnitPage> createState() => _DetailAcUnitPageState();
}

class _DetailAcUnitPageState extends State<DetailAcUnitPage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geç
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return; // ✅ Widget hâlâ ekranda mı?
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailAcUnitRealPage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('AC Unit'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero2', // !!! id:2 olmalı
          child: Icon(Icons.ac_unit, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
