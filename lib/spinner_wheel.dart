import 'package:flutter/material.dart';
import 'dart:math';
import '../core/animation_handler.dart';
import '../core/spin_calculations.dart';
import '../core/image_loader.dart';
import '../widgets/wheel_display.dart';
import '../models/wheel_segment.dart';
import '../controller/spin_controller.dart';

class SpinnerWheel extends StatefulWidget {
  final SpinnerController controller;
  final List<WheelSegment> segments;
  final Function(WheelSegment) onComplete;
  final Color? wheelColor;
  final Color? indicatorColor;
  final Widget? centerChild;
  final Widget? indicator;
  final double? imageHeight;
  final double? imageWidth;
  final TextStyle? labelStyle;

  SpinnerWheel({
    super.key,
    required this.controller,
    required this.segments,
    required this.onComplete,
    this.wheelColor,
    this.indicatorColor,
    this.centerChild,
    this.indicator,
    this.imageHeight,
    this.imageWidth,
    this.labelStyle,
  });

  @override
  State<SpinnerWheel> createState() => SpinnerWheelState();
}

class SpinnerWheelState extends State<SpinnerWheel> with SingleTickerProviderStateMixin {
  List<WheelSegment> processedSegments = [];
  late AnimationController _controller;
  double _startRotation = 0.0, _endRotation = 0.0;

  @override
  void initState() {
    widget.controller.attachState(this);
    processSegments();
    _controller = createSpinController(this,(){
      setState(() {
        _startRotation = _endRotation % (2 * pi);
        widget.onComplete(determineSegment(widget.segments,_endRotation));
      });
    },(){setState(() {});});
    super.initState();
  }

  void processSegments() async {
    processedSegments = await loadSegmentImages(widget.segments);
  }

  Future<void> startSpin() async {
    _controller.reset();
    final result = spinWheel(_startRotation);
    _endRotation = result.end;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WheelDisplay(
      controller: _controller,
      segments: processedSegments,
      startRotation: _startRotation,
      endRotation: _endRotation,
      centerChild: widget.centerChild,
      indicator: widget.indicator,
      wheelColor: widget.wheelColor,
      indicatorColor: widget.indicatorColor,
      imageHeight: widget.imageHeight,
      imageWidth: widget.imageWidth,
      labelStyle: widget.labelStyle,
    );
  }
}
