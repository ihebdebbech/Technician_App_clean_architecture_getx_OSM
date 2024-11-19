import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class ThermometerWidget extends StatefulWidget {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final Duration duration;

  const ThermometerWidget({
    Key? key,
    required this.temperature,
    this.minTemperature = -20,
    this.maxTemperature = 50,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _ThermometerWidgetState createState() => _ThermometerWidgetState();
}

class _ThermometerWidgetState extends State<ThermometerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: widget.minTemperature,
      end: widget.temperature,
    ).animate(_controller);

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(ThermometerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.temperature != widget.temperature) {
      _animation = Tween<double>(
        begin: oldWidget.temperature,
        end: widget.temperature,
      ).animate(_controller);

      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return AnimatedOpacity(
          opacity: _opacityAnimation.value,
          duration: const Duration(seconds: 1),
          child: CustomPaint(
            size: Size(100, 300), // Fixed size
            painter: ThermometerPainter(
              context: context,
              temperature: _animation.value,
              minTemperature: widget.minTemperature,
              maxTemperature: widget.maxTemperature,
            ),
          ),
        );
      },
    );
  }
}

class ThermometerPainter extends CustomPainter {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final BuildContext context;
  ThermometerPainter({
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondarydark
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.scale(context.widthmedia(0.0028));
    final bulbRadius = size.width - 40;
    final bulbRadiusred = size.width - 40;
    final thermometerHeight = size.height - bulbRadius * 2;

    final rect = Rect.fromLTWH(
      size.width - 24.5,
      size.height - 70,
      10,
      size.height - 20,
    );

    final bulb = Offset(31, size.height - bulbRadius);

    canvas.drawCircle(bulb, bulbRadius, paint);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(35)), paint);

    double tempPercentage =
        ((temperature - minTemperature) / (maxTemperature - minTemperature))
            .clamp(0.0, 1.0);

    final fillPaint = Paint()
      ..color = Color.fromARGB(255, 227, 29, 15)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    final fillHeight = (size.height - 29) * tempPercentage;
    final fillRect = Rect.fromLTWH(
      size.width - 23.5,
      size.height - bulbRadiusred - fillHeight,
      8,
      fillHeight,
    );

    canvas.drawRRect(
        RRect.fromRectAndRadius(fillRect, Radius.circular(35)), fillPaint);

    // Draw the filled bulb
    canvas.drawCircle(bulb, bulbRadiusred, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
