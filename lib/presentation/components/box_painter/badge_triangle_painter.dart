import 'dart:math' as math;

import 'package:flutter/material.dart';

class BadgeTrianglePainter extends Decoration {
  const BadgeTrianglePainter({
    required this.badgeColor,
    required this.badgeSize,
    required this.textSpan,
  });

  final Color badgeColor;
  final double badgeSize;
  final TextSpan textSpan;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _BadgeTrianglePainter(badgeColor, badgeSize, textSpan);
}

class _BadgeTrianglePainter extends BoxPainter {
  _BadgeTrianglePainter(this.badgeColor, this.badgeSize, this.textSpan);

  static const double BASELINE_SHIFT = 0;
  static const double CORNER_RADIUS = 0;
  final Color badgeColor;
  final double badgeSize;
  final TextSpan textSpan;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas
      ..save()
      ..translate(offset.dx + configuration.size!.width - badgeSize, offset.dy)
      ..drawPath(buildBadgePath(), getBadgePaint());
    // draw text
    final hyp = math.sqrt(badgeSize * badgeSize * 2);
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: hyp, maxWidth: hyp);
    final halfHeight = textPainter.size.height / 1.5;
    final v = math.sqrt(halfHeight * halfHeight + halfHeight * halfHeight) +
        BASELINE_SHIFT;
    canvas
      ..translate(v, -v)
      ..rotate(0.785398); // 45 degrees
    textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  Paint getBadgePaint() => Paint()
    ..isAntiAlias = true
    ..color = badgeColor;

  Path buildBadgePath() => Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromLTRBAndCorners(0, 0, badgeSize, badgeSize,
            topRight: Radius.circular(CORNER_RADIUS))),
      Path()
        ..lineTo(0, badgeSize)
        ..lineTo(badgeSize, badgeSize)
        ..close());
}
