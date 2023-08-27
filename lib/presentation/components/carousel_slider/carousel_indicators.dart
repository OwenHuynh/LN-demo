import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/utils/screen_util.dart';

typedef CarouselItem = Widget Function(int index);

class CircularWaveSlideIndicator implements SlideIndicator {
  CircularWaveSlideIndicator({
    this.itemSpacing = 12,
    this.indicatorRadius = 6,
    this.padding,
    this.alignment = Alignment.bottomCenter,
    this.currentIndicatorColor = AppColors.bannerIndicator,
    this.indicatorBackgroundColor = AppColors.transparent,
    this.indicatorBorderWidth = 1,
    this.indicatorBorderColor,
    this.renderItem,
    this.showLine = true,
  });

  final double itemSpacing;
  final double indicatorRadius;
  final EdgeInsets? padding;
  final AlignmentGeometry alignment;
  final Color currentIndicatorColor;
  final Color indicatorBackgroundColor;
  final double indicatorBorderWidth;
  final Color? indicatorBorderColor;
  final CarouselItem? renderItem;
  final bool showLine;

  @override
  Widget build(int currentPage, double pageDelta, int itemCount) {
    return Container(
      alignment: alignment,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: itemCount * itemSpacing,
            height: indicatorRadius * 2,
            child: CustomPaint(
              painter: CircularWaveIndicatorPainter(
                currentIndicatorColor: currentIndicatorColor,
                indicatorBackgroundColor: indicatorBackgroundColor,
                currentPage: currentPage,
                pageDelta: pageDelta,
                itemCount: itemCount,
                radius: indicatorRadius,
                indicatorBorderColor: indicatorBorderColor,
                borderWidth: indicatorBorderWidth,
              ),
            ),
          ),
          if (showLine)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.deviceWidth / 3.2),
              child: Divider(
                thickness: 0.8,
                color: Colors.white,
              ),
            ),
          if (renderItem != null) renderItem!(currentPage),
        ],
      ),
    );
  }
}

class CircularWaveIndicatorPainter extends CustomPainter {
  CircularWaveIndicatorPainter({
    this.itemCount,
    this.currentPage,
    this.pageDelta,
    this.radius,
    required Color currentIndicatorColor,
    required Color indicatorBackgroundColor,
    this.indicatorBorderColor,
    double borderWidth = 2,
  }) {
    indicatorPaint
      ..color = indicatorBackgroundColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    currentIndicatorPaint
      ..color = currentIndicatorColor
      ..style = PaintingStyle.fill
      ..strokeWidth = borderWidth
      ..isAntiAlias = true;

    if (indicatorBorderColor != null) {
      borderIndicatorPaint
        ..color = indicatorBorderColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..isAntiAlias = true;
    }
  }

  final int? itemCount;
  final int? currentPage;
  final double? pageDelta;
  final double? radius;
  final Paint indicatorPaint = Paint();
  final Paint currentIndicatorPaint = Paint();
  final Paint borderIndicatorPaint = Paint();
  final Color? indicatorBorderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final dx = itemCount! < 2
        ? size.width
        : (size.width - 2 * radius!) / (itemCount! - 1);
    final y = size.height / 2;
    double? x = radius;
    for (int i = 0; i < itemCount!; i++) {
      canvas.drawCircle(Offset(x!, y), radius!, indicatorPaint);
      x += dx;
    }
    double midX = radius! + dx * currentPage!;
    final double midY = size.height / 2;
    final double r = radius! * ((1.4 * pageDelta! - 0.7).abs() + 0.3);

    if (indicatorBorderColor != null) {
      x = radius;
      for (int i = 0; i < itemCount!; i++) {
        canvas.drawCircle(Offset(x!, y), radius!, borderIndicatorPaint);
        x += dx;
      }
    }

    if (currentPage == itemCount! - 1) {
      canvas.save();
      final path = Path()
        ..addOval(Rect.fromLTRB(0, midY - radius!, 2 * radius!, midY + radius!))
        ..addOval(Rect.fromLTRB(size.width - 2 * radius!, midY - radius!,
            size.width, midY + radius!));
      canvas
        ..clipPath(path)
        ..drawCircle(Offset(2 * radius! * pageDelta! - radius!, midY), r,
            currentIndicatorPaint);
      midX += 2 * radius! * pageDelta!;
    } else {
      midX += dx * pageDelta!;
    }
    canvas.drawCircle(Offset(midX, midY), r + 1, currentIndicatorPaint);
    if (currentPage == itemCount! - 1) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

abstract class SlideIndicator {
  Widget build(int currentPage, double pageDelta, int itemCount);
}
