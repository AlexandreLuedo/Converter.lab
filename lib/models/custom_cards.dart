import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double internalPadding;
  final Color? backgroundColor;

  const CustomCards({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    this.internalPadding = 16.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        backgroundColor ??
        Theme.of(context)
            .colorScheme
            .primaryContainer; // Get color if we haven't specified colors

    return Container(
      decoration: BoxDecoration(
        color: effectiveColor,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      // Using the var passed by the constructor
      child: Padding(padding: EdgeInsets.all(internalPadding), child: child),
    );
  }
}
