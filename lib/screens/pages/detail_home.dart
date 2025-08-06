import 'package:flutter/material.dart';
import 'real/detail_home_real.dart'; // gerçek sayfayı buradan çağıracağız

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({super.key});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya otomatik geçiş yap
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailHomeRealPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: const Text('Home'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero1',
          child: Icon(Icons.home, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
