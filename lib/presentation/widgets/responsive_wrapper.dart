import 'package:flutter/material.dart';

/// A reusable widget that centers content and constrains its max width.
/// Replaces all usages of the old responsive_framework `ResponsiveWrapper`.
class ResponsiveContainer extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const ResponsiveContainer({
    super.key,
    required this.maxWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
