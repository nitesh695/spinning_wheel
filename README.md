readme_content = """# 🎡 Spinning Wheel - Flutter Package
=====================================================

[![pub package](https://img.shields.io/pub/v/spinning_wheel.svg)](https://pub.dev/packages/spinning_wheel) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![GitHub stars](https://img.shields.io/github/stars/nitesh695/spinning_wheel?style=social)](https://github.com/nitesh695/spinning_wheel)

A *customizable and animated spinning wheel* for Flutter, perfect for *games, lucky draws, and prize wheels*. 🎰🎯

## ✨ Features
✅ *Smooth spinning animation*  
✅ *Customizable segments with images & colors*  
✅ *Supports touch interaction*  
✅ *Easy integration with controllers*

---


## 📸 Demo
<p align="center">
  <img src="https://your-demo-gif-url.com/spinning_wheel_demo.gif" width="300">
</p>

---

## 🚀 Installation

Add this to your ⁠ pubspec.yaml ⁠:
```yaml
dependencies:
  spinning_wheel: ^0.0.1  # Use latest version from pub.dev

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
