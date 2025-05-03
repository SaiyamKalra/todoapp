import 'package:flutter/material.dart';

class GlassmorphicButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GlassmorphicButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            // Simulate glass with gradient and opacity
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white.withAlpha(24), Colors.white.withAlpha(5)],
            ),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white.withAlpha(50), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(24),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white.withAlpha(242),
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    color: Colors.black.withAlpha(64),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
