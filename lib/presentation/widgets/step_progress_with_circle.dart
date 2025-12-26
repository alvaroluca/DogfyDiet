import 'package:dogfydiet/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StepProgressWithCircle extends StatelessWidget {
  final int selectedIndex;
  final int steps;
  final double circleSize;
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;
  final Color? circleColor;
  final double topOffset;

  const StepProgressWithCircle({
    super.key,
    required this.selectedIndex,
    this.steps = 3,
    this.circleSize = 30,
    this.height = 44,
    this.progressColor,
    this.backgroundColor,
    this.circleColor,
    this.topOffset = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final positions = List.generate(
            steps,
            (i) => i == 0
                ? 0.0
                : i == steps - 1
                ? constraints.maxWidth - circleSize
                : (constraints.maxWidth - circleSize) * i / (steps - 1),
          );
          final left = (selectedIndex >= 0 && selectedIndex < positions.length)
              ? positions[selectedIndex]
              : 0.0;
          double progressValue = 0.0;
          if (selectedIndex > 0 && selectedIndex < steps) {
            progressValue = selectedIndex / (steps - 1);
          }
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                top: circleSize / 2 + 2,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    minHeight: 8,
                    backgroundColor: backgroundColor ?? Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progressColor ?? Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: left,
                top: topOffset,
                child: Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor ?? const Color(AppColors.yellowStep),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
