import 'package:flutter/foundation.dart';
import '../spinner_wheel.dart';

class SpinnerController {
  SpinnerWheelState? _state;

  void attachState(SpinnerWheelState state) {
    _state = state;
  }

  Future<void> startSpin() async {
    if (_state != null) {
      await _state!.startSpin();
    } else {
      if (kDebugMode) {
        print("Error: SpinnerWheelState is not attached to the controller!");
      }
    }
  }
}
