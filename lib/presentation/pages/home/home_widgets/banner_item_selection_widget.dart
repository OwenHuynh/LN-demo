import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lnsp/utils/screen_util.dart';

class BannerItemSelectionWidget extends StatelessWidget {
  BannerItemSelectionWidget(
      {required this.imageList, required this.onClickItem});

  final List<String> imageList;
  final Function(int index) onClickItem;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var i = 0; i < imageList.length; i++)
        Expanded(
            child: GestureDetector(
          onTap: () => onClickItem(i),
          child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              height: ScreenUtil.deviceWidth / imageList.length,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            imageUrl: imageList[i],
          ),
        ))
    ]);
  }
}
