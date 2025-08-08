import 'package:flutter/material.dart';
import 'real/detail_music_real.dart';

class DetailMusicPage extends StatefulWidget {
  const DetailMusicPage({super.key});

  @override
  State<DetailMusicPage> createState() => _DetailMusicPageState();
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  @override
  void initState() {
    super.initState();

    // 0.3 saniye sonra gerçek sayfaya geç
    Future.delayed(const Duration(milliseconds: 300), () {
      if(!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const DetailMusicReal()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Hero(
          tag: 'iconHero5', // ID 5’e göre
          child: Icon(Icons.music_note, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
