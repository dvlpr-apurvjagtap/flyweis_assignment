import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

/// Splash logo widget that displays the app logo with animations
class SplashLogo extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final double size;

  const SplashLogo({
    super.key,
    required this.scaleAnimation,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(size / 3.5),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.casino,
              size: 60,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
