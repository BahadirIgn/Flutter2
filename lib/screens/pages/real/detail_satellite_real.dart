import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Api gerekiyor google maps için. Ücretsiz ama daha sonra yap

class DetailSatelliteRealPage extends StatefulWidget {
  const DetailSatelliteRealPage({super.key});

  @override
  State<DetailSatelliteRealPage> createState() => _DetailSatelliteRealPageState();
}

class _DetailSatelliteRealPageState extends State<DetailSatelliteRealPage> {
  late GoogleMapController _mapController;

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(41.015137, 28.979530), // Örnek: İstanbul
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uydu Haritası"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        mapType: MapType.satellite, // <<< Uydu görünümü
        myLocationEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
