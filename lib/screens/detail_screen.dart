// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../data/tile_data.dart';

class DetailScreen extends StatelessWidget {
  final TileItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      appBar: AppBar(
        backgroundColor: item.color,
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: 'iconHero${item.id}',
          child: Icon(item.iconData, size: 150, color: Colors.white),
        ),
      ),
    );
  }
}
