import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/empty_state.dart';

class KeyFeaturesMenu extends StatelessWidget {
  const KeyFeaturesMenu({
    super.key,
    this.keyFeaturesSize,
    this.bulletSize,
    this.bulletHeight,
    required this.projectsModal,
    this.iconSize,
  });

  final double? keyFeaturesSize;
  final double? bulletSize;
  final double? bulletHeight;
  final ProjectData projectsModal;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    if (projectsModal.keyFeatures.isEmpty) {
      return EmptyState(
          message: "No key features have been listed for this project yet.");
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projectsModal.keyFeatures.length,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          return KeyFeaturesItem(
            keyFeature: projectsModal.keyFeatures[index],
            bulletHeight: bulletHeight,
            bulletSize: bulletSize,
            keyFeaturesSize: keyFeaturesSize,
            iconsize: iconSize,
          );
        },
      ),
    );
  }
}

class KeyFeaturesItem extends StatelessWidget {
  const KeyFeaturesItem({
    super.key,
    this.keyFeaturesSize,
    this.bulletSize,
    this.bulletHeight,
    required this.keyFeature,
    this.iconsize,
  });

  final double? keyFeaturesSize;
  final double? bulletSize;
  final double? bulletHeight;
  final KeyFeature keyFeature;
  final double? iconsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow_rounded,
              size: iconsize ?? 18.w,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                keyFeature.feature,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  wordSpacing: 2.w,
                  height: 2.h,
                  fontSize: keyFeaturesSize ?? 17.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
