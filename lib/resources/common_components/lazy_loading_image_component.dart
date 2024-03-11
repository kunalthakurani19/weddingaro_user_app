// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LazyLoadingImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const LazyLoadingImage({
    Key? key,
    required this.imageUrl,
    this.height = 70,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(imageUrl), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: height,
            width: width,
            color: Colors.grey[200],
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            height: height,
            width: width,
            color: Colors.red,
            child: const Center(
              child: Icon(Icons.error),
            ),
          );
        } else {
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: height,
            width: width,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: height,
                width: width,
                color: Colors.red,
                child: const Center(
                  child: Icon(Icons.error),
                ),
              );
            },
          );
        }
      },
    );
  }
}
