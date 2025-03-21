import 'dart:math';
import '../models/wheel_segment.dart';

class SpinResult {
  final double start;
  final double end;
  SpinResult(this.start, this.end);
}

SpinResult spinWheel(double startRotation) {
  final Random random = Random();
  final int spinCount = 5 + random.nextInt(5);
  final double extraSpin = random.nextDouble() * 2 * pi;
  double endRotation = startRotation + (spinCount * 2 * pi) + extraSpin;

  return SpinResult(startRotation, endRotation);
}

WheelSegment determineSegment(List<WheelSegment> segments, double endRotation) {
  final double normalizedAngle = endRotation % (2 * pi);
  final double segmentAngle = 2 * pi / segments.length;
  final double invertedAngle = 2 * pi - normalizedAngle;
  final int segmentIndex = (invertedAngle ~/ segmentAngle) % segments.length;

  return segments[segmentIndex];
}
