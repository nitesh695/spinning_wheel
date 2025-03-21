import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../models/wheel_segment.dart';

class WheelPainter extends CustomPainter {
  final List<WheelSegment> segments;
  final double? imageHeight;
  final double? imageWidth;
  final TextStyle? style;

  WheelPainter(this.segments, {this.imageHeight, this.imageWidth,this.style});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Rect rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);
    final double segmentAngle = 2 * pi / segments.length;
    final double startAngle = -pi / 2 - segmentAngle / 40;

    for (int i = 0; i < segments.length; i++) {
      _drawSegment(canvas, rect, startAngle + i * segmentAngle, segmentAngle, segments[i]);
      _drawImage(canvas, radius, startAngle + i * segmentAngle, segmentAngle, segments[i]);
      _drawLabel(canvas, radius, startAngle + i * segmentAngle, segmentAngle, segments[i]);
    }
  }

  void _drawSegment(Canvas canvas, Rect rect, double angle, double segmentAngle, WheelSegment segment) {
    final Paint segmentPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [segment.color.withOpacity(0.7), segment.color],
        stops: const [0.3, 1.0],
      ).createShader(rect);

    canvas.drawArc(rect, angle, segmentAngle, true, segmentPaint);
  }

  void _drawImage(Canvas canvas, double radius, double angle, double segmentAngle, WheelSegment segment) {
    if (segment.image != null) {
      final double imageRadius = radius * 0.55;
      final Offset imageCenter = Offset(
        radius + cos(angle + segmentAngle / 2) * imageRadius,
        radius + sin(angle + segmentAngle / 2) * imageRadius,
      );

      canvas.save();
      canvas.translate(imageCenter.dx, imageCenter.dy);
      canvas.rotate(angle + segmentAngle / 2 + pi / 2);

      final Rect srcRect = Rect.fromLTWH(0, 0, segment.image!.width.toDouble(), segment.image!.height.toDouble());
      final Rect dstRect = Rect.fromCenter(
        center: Offset(0, 0),
        width: imageWidth ?? radius * 0.28,
        height: imageHeight ?? radius * 0.28,
      );

      canvas.drawImageRect(segment.image!, srcRect, dstRect, Paint());
      canvas.restore();
    }
  }

  void _drawLabel(Canvas canvas, double radius, double angle, double segmentAngle, WheelSegment segment) {
    final double labelRadius = radius * 0.75;
    final Offset labelCenter = Offset(
      radius + cos(angle + segmentAngle / 2) * labelRadius,
      radius + sin(angle + segmentAngle / 2) * labelRadius,
    );

    canvas.save();
    canvas.translate(labelCenter.dx, labelCenter.dy);
    canvas.rotate(angle + segmentAngle / 2 + pi / 2);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: segment.label,
        style: style ?? TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(WheelPainter oldDelegate) => oldDelegate.segments != segments;
}
