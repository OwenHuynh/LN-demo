import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarCircular extends StatelessWidget {
  AvatarCircular({
    required this.imageUrl,
    required this.size,
  });

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
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
