import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailMusicRealPage extends StatefulWidget {
  const DetailMusicRealPage({super.key});

  @override
  State<DetailMusicRealPage> createState() => _DetailMusicRealPageState();
}

class _DetailMusicRealPageState extends State<DetailMusicRealPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A40),
      appBar: AppBar(
        title: const Text('Music'),
        backgroundColor: const Color(0xFF3D348B),
        elevation: 0,
      ),
      body: _isLoading ? _buildShimmerList() : _buildMusicList(),
    );
  }

  /// Gerçek içerik: Şarkı listesi
  Widget _buildMusicList() {
    final songs = List.generate(10, (index) => 'Song ${index + 1}');
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return Card(
          color: const Color(0xFF3D348B),
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.music_note, color: Colors.white),
            title: Text(
              songs[index],
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: const Text('Artist Name',
                style: TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.play_arrow, color: Colors.white),
          ),
        );
      },
    );
  }

  /// Yüklenirken shimmer efekti göster
  Widget _buildShimmerList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 14, width: double.infinity, color: Colors.white),
                      const SizedBox(height: 8),
                      Container(height: 12, width: 100, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
