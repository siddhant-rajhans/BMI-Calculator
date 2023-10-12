import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class ImageViewScreen extends StatelessWidget {
  final String imagePath;

  ImageViewScreen({required this.imagePath}); // Correct the constructor

  @override
  Widget build(BuildContext context) {
    // Load the image
    final File file = File(imagePath);
    img.Image? image = img.decodeImage(file.readAsBytesSync());

    // Rotate the image by 90 degrees
    img.Image rotatedImage = img.copyRotate(image!, angle: 90);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Chart'),
      ),
      body: PhotoView(
        imageProvider: MemoryImage(Uint8List.fromList(img.encodePng(rotatedImage))),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
        initialScale: PhotoViewComputedScale.covered,
        backgroundDecoration: BoxDecoration(color: Colors.black),
      ),
    );
  }
}
