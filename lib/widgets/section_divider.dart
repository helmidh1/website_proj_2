import 'dart:ui';
import 'package:flutter/material.dart';

class SectionBlurDivider extends StatelessWidget {
  final double height;
  final double blurAmount;

  const SectionBlurDivider({
    super.key,
    this.height = 100,
    this.blurAmount = 10,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // Fade gradient in the background to blend colors
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDark
                    ? [
                        const Color(
                          0xFF0F172A,
                        ).withValues(alpha: 0.0), // Intro dark color
                        const Color(0xFF0F172A), // Experience dark color
                      ]
                    : [
                        const Color(
                          0xFFF1F5F9,
                        ).withValues(alpha: 0.0), // Intro light color
                        Colors.white, // Experience light color
                      ],
              ),
            ),
          ),
          // The actual blur effect
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: blurAmount),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
