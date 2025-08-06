import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../data/tile_data.dart';
import '../utils/navigation_helper.dart';

class StaggeredGridExample extends StatelessWidget {
  const StaggeredGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = TileData.items;

    return Scaffold( 
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: MasonryGridView.count(
          crossAxisCount: 2, // 2 sütun: sol & sağ
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          physics: const BouncingScrollPhysics(), // Scroll hissiyatı
          itemCount: tiles.length,
          itemBuilder: (context, index) {
            final tile = tiles[index];

            return GestureDetector(
              onTap: () {
                NavigationHelper.navigateToDetail(context, tile.id);
              },
              child: Container(
                height: tile.height + 80, // 👈 Burada kutu yüksekliğini artırıyoruz!
                decoration: BoxDecoration(
                  color: tile.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'iconHero${tile.id}',
                      child: Icon(tile.iconData, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tile.name,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
