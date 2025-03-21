Spinning Wheel 🎡

A fully customizable spinning wheel for Flutter applications! Easily create fortune wheels, prize spinners, or game-based random selectors with smooth animations and custom segments.

🌟 Features

✅ Fully customizable spinning wheel 🎨
✅ Supports text labels, colors, and images 🖼️
✅ Smooth animation with realistic spin physics 🎯
✅ Callback for detecting spin completion 🔥

📦 Installation

Add this package to your pubspec.yaml:

dependencies:
spinning_wheel: latest_version
Then, run:

flutter pub get
🔧 Usage

1️⃣ Import the Package
import 'package:spinning_wheel/spinning_wheel.dart';
2️⃣ Create a SpinnerController
final SpinnerController controller = SpinnerController();
3️⃣ Define Wheel Segments
List<WheelSegment> segments = [
WheelSegment("Prize 1", Colors.red, 10),
WheelSegment("Prize 2", Colors.blue, 20),
WheelSegment("Prize 3", Colors.green, 30),
WheelSegment("Prize 4", Colors.orange, 40),
];
4️⃣ Add the SpinnerWheel Widget
SpinnerWheel(
controller: controller,
segments: segments,
wheelColor: Colors.white,
onComplete: (result) {
print("You won: ${result.label}");
},
);
5️⃣ Start Spinning!
controller.startSpin();
🖼️ Screenshot

<img src="https://your-image-url.com/spinning-wheel-demo.gif" width="300"/>
📜 API Reference

Property	Type	Description
controller	SpinnerController	Controls the spin animation
segments	List<WheelSegment>	List of wheel segments (labels, colors, images)
wheelColor	Color?	Background color of the wheel
onComplete	Function(WheelSegment)	Callback triggered when spin completes
centerChild	Widget?	Custom widget for the wheel center
📄 License

This package is licensed under the MIT License.

🙏 Support

If you like this package, ⭐ Star it on GitHub!
For issues or feature requests, open an issue on GitHub.

🚀 Happy Spinning! 🎡✨