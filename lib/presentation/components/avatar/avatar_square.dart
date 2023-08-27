import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarSquare extends StatelessWidget {
  AvatarSquare({
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      imageUrl: imageUrl,
    );
  }
}
