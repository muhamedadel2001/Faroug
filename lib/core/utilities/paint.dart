import 'dart:math';

import 'package:flutter/material.dart';

import 'styles/colors.dart';

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  final double num4;
  const ProgressButton({super.key, required this.onNext, required this.num4});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.182,
      height: MediaQuery.of(context).size.height * 0.088,
      child: Stack(children: [
        AnimatedIndicator(
          num2: num4,
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            onTap: onNext,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.071,
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      end: Alignment.centerLeft,
                      begin: Alignment.centerRight,
                      colors: [brandPrimaryColor, brandSecondColor]),
                  borderRadius: BorderRadius.circular(99),
                  color: Colors.blue),
              child: Center(
                  child: Icon(
                Icons.navigate_next,
                color: Colors.white.withOpacity(0.9),
              )),
            ),
          ),
        )
      ]),
    );
  }
}

class AnimatedIndicator extends StatefulWidget {
  final Duration duration;
  final double size;
  final double num2;
  final VoidCallback callback;
  const AnimatedIndicator(
      {super.key,
      required this.duration,
      required this.size,
      required this.callback,
      required this.num2});

  @override
  _AnimatedIndicatorState createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(widget.size, widget.size),
        painter: ProgressPainter(widget.num2));
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;
  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // setup
    var linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = brandPrimaryColor;

    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    final radians = (progress / 100) * 2 * pi;
    _drawArc(canvas, linePaint, circlePaint, -pi / 2, radians, size);
  }

  void _drawArc(
    Canvas canvas,
    Paint linePaint,
    Paint circlePaint,
    double startRadian,
    double sweepRadian,
    Size size,
  ) {
    final centerX = size.width / 2, centerY = size.height / 2;
    final centerOffset = Offset(centerX, centerY);
    final double radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius),
        startRadian, sweepRadian, false, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}
