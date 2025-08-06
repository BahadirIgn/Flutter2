import 'package:flutter/material.dart';
import 'real/detail_portrait_real.dart'; // Gerçek içerik sayfası

class DetailPortraitPage extends StatefulWidget {
  const DetailPortraitPage({super.key});

  @override
  State<DetailPortraitPage> createState() => _DetailPortraitPageState();
}

class _DetailPortraitPageState extends State<DetailPortraitPage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geç
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailPortraitRealPage()),
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
        title: const Text('Portrait'),
      ),
      body: const Center(
        child: Hero(
          tag: 'iconHero4', // dikkat: id = 4
          child: Icon(Icons.portrait, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
