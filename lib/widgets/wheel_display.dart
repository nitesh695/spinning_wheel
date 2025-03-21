import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spinning_wheel/widgets/wheel_painter.dart';
import '../models/wheel_segment.dart';
import 'indicator.dart';

class WheelDisplay extends StatelessWidget {
  final AnimationController controller;
  final List<WheelSegment> segments;
  final double startRotation;
  final double endRotation;
  final Widget? centerChild;
  final Widget? indicator;
  final Color? wheelColor;
  final Color? indicatorColor;
  final double? imageHeight;
  final double? imageWidth;
  final TextStyle? labelStyle;

  const WheelDisplay({
    super.key,
    required this.controller,
    required this.segments,
    required this.startRotation,
    required this.endRotation,
    this.centerChild,
    this.indicator,
    this.wheelColor,
    this.indicatorColor,
    this.imageHeight,
    this.imageWidth,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = min(constraints.maxWidth, constraints.maxHeight);
        return Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: size,
                  height: size,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: size,
                        height: size,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'packages/spinning_wheel/assets/wheel.png',
                            fit: BoxFit.contain,
                            color: wheelColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size,
                        height: size,
                        child: Transform.rotate(
                          angle: Tween(begin: startRotation, end: endRotation)
                              .animate(
                                CurvedAnimation(
                                  parent: controller,
                                  curve: Curves.easeOutCirc,
                                ),
                              )
                              .value,
                          child: Padding(
                            padding: EdgeInsets.all(size * 0.094),
                            child: CustomPaint(
                              size: Size(size, size),
                              painter: WheelPainter(
                                  segments,
                                  imageHeight: imageHeight ?? (size * 0.11),
                                  imageWidth: imageWidth ?? (size * 0.11),
                                  style: labelStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -5,
                  child: indicator ?? ClipPath(
                    clipper: TriangleBottomClipper(),
                    child: Container(
                      width: size * 0.03,
                      height: size * 0.15,
                      decoration: BoxDecoration(
                        color: indicatorColor ?? Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: size * 0.015,
                          height: size * 0.015,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: size * 0.12,
                height: size * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.grey],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: centerChild ?? Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.radio_button_checked,
                            color: Colors.redAccent,
                            size: size * 0.1,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
