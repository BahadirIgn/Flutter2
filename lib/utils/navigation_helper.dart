import 'package:flutter/material.dart';
import '../screens/pages/detail_home.dart';
import '../screens/pages/detail_ac_unit.dart';
import '../screens/pages/detail_landscape.dart';
import '../screens/pages/detail_portrait.dart';
import '../screens/pages/detail_music.dart';
import '../screens/pages/detail_alarm.dart';
import '../screens/pages/detail_satellite.dart';
import '../screens/pages/detail_star.dart';
import '../screens/pages/detail_lightbulb.dart';

class NavigationHelper {
  static void navigateToDetail(BuildContext context, int id) {
    final page = _getDetailPageById(id);

    if (page != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sayfa bulunamadı')),
      );
    }
  }

  static Widget? _getDetailPageById(int id) {
    switch (id) {
      case 1:
        return const DetailHomePage();
      case 2:
        return const DetailAcUnitPage();
      case 3:
        return const DetailLandscapePage();
      case 4:
        return const DetailPortraitPage();
      case 5:
        return const DetailMusicPage();
      case 6:
        return const DetailAlarmPage();
      case 7:
        return const DetailSatellitePage();
      case 8:
        return const DetailStarPage();
      case 9:
        return const DetailLightbulbPage();
      default:
        return null;
    }
  }
}
