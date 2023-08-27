import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';

class BannerItemWidget extends StatelessWidget {
  BannerItemWidget({
    required this.imageUrl,
    this.isSucceed = false,
    this.title,
  });

  final bool isSucceed;
  final String imageUrl;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          imageUrl: imageUrl,
        ),
        if (title != null)
          Positioned.fill(
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  title!,
                  style: TextStyle(color: AppColors.white, fontSize: 56),
                )),
          ),
      ],
    );
  }
}
