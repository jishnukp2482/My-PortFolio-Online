import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        color: AppColors.offWhite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width,
                    height: height,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width,
                    height: height,
                    color: Colors.white,
                  ),
                  Container(
                    width: width,
                    height: height,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
