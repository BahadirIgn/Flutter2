import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // BURAYA DİKKAT
import 'dart:convert';

class DetailPortraitRealPage extends StatefulWidget {
  const DetailPortraitRealPage({super.key});

  @override
  State<DetailPortraitRealPage> createState() => _DetailPortraitRealPageState();
}

class _DetailPortraitRealPageState extends State<DetailPortraitRealPage> {
  List<AssetEntity> images = [];
  AssetEntity? selectedImage;
  String? prediction;

  @override
  void initState() {
    super.initState();
    _fetchAllImages();
  }

  Future<void> _fetchAllImages() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.hasAccess) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("İzin Gerekli"),
            content: const Text("Fotoğrafları görüntüleyebilmek için uygulamaya erişim izni vermeniz gerekiyor."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Tamam"),
              ),
            ],
          ),
        );
      }
      return;
    }

    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    final AssetPathEntity album = albums.first;

    final List<AssetEntity> media = await album.getAssetListPaged(
      page: 0,
      size: 1000,
    );

    setState(() {
      images = media;
      if (images.isNotEmpty) {
        selectedImage = images.first;
        _sendImageForPrediction(selectedImage!);
      }
    });
  }

  Future<Uint8List?> _getImageData(AssetEntity entity, {int size = 500}) {
    return entity.thumbnailDataWithSize(ThumbnailSize(size, size));
  }

  Future<void> _sendImageForPrediction(AssetEntity image) async {
    final bytes = await image.originBytes;
    if (bytes == null) return;

    var uri = Uri.parse('http://10.0.2.2:5000/predict');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        bytes,
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var jsonResp = json.decode(response.body);
        setState(() {
          prediction = jsonResp['prediction'];
        });
      } else {
        setState(() {
          prediction = 'Tahmin alınamadı (${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        prediction = 'API hatası: $e';
      });
    }
  }

  void _onSelectedImageChanged(AssetEntity newImage) {
    setState(() {
      selectedImage = newImage;
      prediction = null;
    });

    _sendImageForPrediction(newImage);
  }

  @override
  Widget build(BuildContext context) {
    final int initialPage = images.isNotEmpty ? images.indexOf(selectedImage ?? images.first) : 0;
    final PageController pageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.25,
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF121212), Color(0xFF1F1F1F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: images.isEmpty
            ? const Center(
                child: Text(
                  "Fotoğraflar yükleniyor...",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Column(
                children: [
                  SafeArea(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      title: Text("Tüm Fotoğraflar - \nTahmin: ${prediction ?? 'Bekleniyor...'}"),
                      centerTitle: true,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: FutureBuilder<Uint8List?>(
                      future: selectedImage?.originBytes,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator(color: Colors.white));
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text(
                              "Resim gösterilemiyor",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: images.length,
                      onPageChanged: (index) {
                        _onSelectedImageChanged(images[index]);
                      },
                      itemBuilder: (context, index) {
                        final image = images[index];
                        final isSelected = image == selectedImage;

                        return FutureBuilder<Uint8List?>(
                          future: _getImageData(image, size: 100),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              );
                            }

                            return AnimatedScale(
                              scale: isSelected ? 1.05 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 4,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    snapshot.data!,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
      ),
    );
  }
}
