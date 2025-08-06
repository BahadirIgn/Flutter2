import 'package:flutter/material.dart';
import '../data/tile_data.dart'; // BURASI ÖNEMLİ: TileItem tanımı burada
import '../utils/navigation_helper.dart';

class AnimatedIconTransitionPage extends StatefulWidget {
  final TileItem tile;

  const AnimatedIconTransitionPage({super.key, required this.tile});

  @override
  State<AnimatedIconTransitionPage> createState() => _AnimatedIconTransitionPageState();
}

class _AnimatedIconTransitionPageState extends State<AnimatedIconTransitionPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.of(context).pop(); // Bu sayfayı kapat
      NavigationHelper.navigateToDetail(context, widget.tile.id); // Gerçek sayfaya git
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Arkaplan görünmez
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: widget.tile.color,
              shape: BoxShape.circle,
            ),
            child: Icon(widget.tile.iconData, size: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
