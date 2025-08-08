import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';

class DetailMusicReal extends StatefulWidget {
  const DetailMusicReal({Key? key}) : super(key: key);

  @override
  State<DetailMusicReal> createState() => _DetailMusicRealState();
}

class _DetailMusicRealState extends State<DetailMusicReal> {
  List<dynamic> _songs = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentlyPlayingIndex;

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/songs'));

    if (response.statusCode == 200) {
      setState(() {
        _songs = json.decode(response.body);
      });
    } else {
      // Hata yönetimi
      debugPrint('Veri çekme hatası: ${response.statusCode}');
    }
  }

  Future<void> playSong(String url, int index) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(url));
    setState(() {
      _currentlyPlayingIndex = index;
    });
  }

  Widget buildSongCard(Map<String, dynamic> song, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          song['title'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Artist: ${song['artist']}'),
            Text('Genre: ${song['genre']}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            _currentlyPlayingIndex == index ? Icons.pause_circle : Icons.play_circle,
            size: 32,
            color: Colors.blueAccent,
          ),
          onPressed: () => playSong(song['audio_url'], index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Müzik Listesi'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _songs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _songs.length,
              itemBuilder: (context, index) {
                return buildSongCard(_songs[index], index);
              },
            ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
