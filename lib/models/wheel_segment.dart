import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WheelSegment {
  final String label;
  final Color color;
  final int value;
  String? path;
  ui.Image? image;

  WheelSegment(this.label, this.color, this.value, {this.path, this.image});
}
