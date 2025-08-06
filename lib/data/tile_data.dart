import 'package:flutter/material.dart';

class TileItem {
  final int id;
  final String name;
  final Color color;
  final IconData iconData;
  final double height;

  const TileItem({
    required this.id,
    required this.name,
    required this.color,
    required this.iconData,
    required this.height,
  });
}

class TileData {
  static const List<TileItem> items = [
    TileItem(
      id: 1,
      name: 'Home',
      color: Colors.red,
      iconData: Icons.home,
      height: 180,
    ),
    TileItem(
      id: 2,
      name: 'AC Unit',
      color: Colors.lightBlueAccent,
      iconData: Icons.ac_unit,
      height: 100,
    ),
    TileItem(
      id: 3,
      name: 'Landscape',
      color: Colors.tealAccent,
      iconData: Icons.landscape,
      height: 160,
    ),
    TileItem(
      id: 4,
      name: 'Portrait',
      color: Colors.green,
      iconData: Icons.portrait,
      height: 120,
    ),
    TileItem(
      id: 5,
      name: 'Music Note',
      color: Colors.deepPurpleAccent,
      iconData: Icons.music_note,
      height: 200,
    ),
    TileItem(
      id: 6,
      name: 'Alarm',
      color: Colors.orange,
      iconData: Icons.access_alarms,
      height: 140,
    ),
    TileItem(
      id: 7,
      name: 'Satellite',
      color: Color.fromARGB(255, 74, 55, 128),
      iconData: Icons.satellite_outlined,
      height: 160,
    ),
    TileItem(
      id: 8,
      name: 'Star',
      color: Color.fromARGB(255, 255, 230, 0),
      iconData: Icons.star,
      height: 110,
    ),
    TileItem(
      id: 9,
      name: 'Lightbulb',
      color: Color.fromARGB(144, 207, 204, 30),
      iconData: Icons.lightbulb,
      height: 150,
    ),
  ];
}
