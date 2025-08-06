// lib/widgets/animated_icon_tile.dart
import 'package:flutter/material.dart';
import '../data/tile_data.dart'; // TileItem burada

class AnimatedIconTile extends StatelessWidget {
  final TileItem item;
  final VoidCallback onTap;

  const AnimatedIconTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: item.height,
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'iconHero${item.id}',
                child: Icon(item.iconData, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
