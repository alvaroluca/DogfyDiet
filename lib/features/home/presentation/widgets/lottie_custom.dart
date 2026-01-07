import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCustom extends StatelessWidget {
  final String assetName;
  final double height;

  const LottieCustom({
    super.key,
    required this.assetName,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Lottie.asset(
          assetName,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
