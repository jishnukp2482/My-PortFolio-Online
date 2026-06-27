import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIcon extends StatelessWidget {
  final IconData icon;
  final double iconsize;
  const ShimmerIcon({
    super.key,
    required this.icon,
    required this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.7),
      highlightColor: Colors.grey.shade100,
      child: Icon(
        icon,
        size: iconsize,
      ),
    );
  }
}
