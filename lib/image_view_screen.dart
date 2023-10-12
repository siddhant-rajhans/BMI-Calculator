import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:image/image.dart' as img;


Future<img.Image?> loadImageAndRotate(String imagePath) async {
  final ByteData data = await rootBundle.load(imagePath);
  final List<int> bytes = data.buffer.asUint8List();
  final img.Image? image = img.decodeImage(Uint8List.fromList(bytes));

  if (image != null) {
    return img.copyRotate(image, angle: 90);
  }

  return null;
}

class ImageViewScreen extends StatelessWidget {
  final String imagePath;

  ImageViewScreen(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<img.Image?>(
      future: loadImageAndRotate(imagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text('BMI Chart'),
              backgroundColor: Colors.black,
            ),
            body: PhotoView(
              imageProvider: MemoryImage(Uint8List.fromList(img.encodePng(snapshot.data!))),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              initialScale: PhotoViewComputedScale.covered,
              backgroundDecoration: BoxDecoration(color: Colors.black),
            ),
          );
        } else {
          // Handle loading or error state here
          return CircularProgressIndicator(); // You can replace this with a loading indicator
        }
      },
    );
  }
}
