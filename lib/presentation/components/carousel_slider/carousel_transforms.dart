import 'package:flutter/material.dart';

class DefaultSlideTransform implements SlideTransform {
  const DefaultSlideTransform();

  @override
  Widget transform(BuildContext context, Widget page, int index,
      int? currentPage, double pageDelta, int itemCount) {
    return page;
  }
}

abstract class SlideTransform {
  Widget transform(BuildContext context, Widget page, int index,
      int? currentPage, double pageDelta, int itemCount);
}
