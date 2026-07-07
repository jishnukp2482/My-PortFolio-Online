import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_shimmer.dart';

class AboutDescriptionShimmer extends StatelessWidget {
  const AboutDescriptionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.grey[800]!.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            6,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ShimmerWidget(
                height: 15.h,
                width: double.infinity,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
