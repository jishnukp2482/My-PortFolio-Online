import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/socialmedia_grid.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class ContactView extends StatelessWidget {
  const ContactView(
      {super.key,
      this.profileHeight,
      this.profileWidth,
      this.contactIocnSize,
      this.itemDistances,
      this.locationwidth,
      this.socialMediaGridWidth,
      this.nameFontSize,
      this.roleFontSize,
      this.locationFontSize,
      this.locationIconSize,
      this.nameAndGridDistance,
      this.gridhorizontalPadding});
  final double? profileHeight;
  final double? profileWidth;
  final double? contactIocnSize;
  final double? itemDistances;
  final double? locationwidth;
  final double? socialMediaGridWidth;
  final double? nameFontSize;
  final double? roleFontSize;
  final double? locationFontSize;
  final double? locationIconSize;
  final double? nameAndGridDistance;
  final double? gridhorizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: AppColors.appBlue,
        borderRadius: BorderRadius.circular(20.w),
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColorDark,
          AppColors.lightBlack,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: profileHeight ?? 100.w,
              height: profileWidth ?? 120.h,
              decoration: BoxDecoration(
                color: AppColors.appBlue,
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  AppColors.lightBlack,
                  Theme.of(context).primaryColorDark,
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: Icon(
                Icons.person,
                size: contactIocnSize ?? 50.sp,
                color: AppColors.grey,
              ),
            ),
            SizedBox(
              height: itemDistances ?? 8.h,
            ),
            Text(
              "Jishnu kp",
              style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.w,
                  fontSize: nameFontSize ?? 22.sp),
            ),
            SizedBox(
              height: itemDistances ?? 2.h,
            ),
            Text(
              "Flutter Developer",
              style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.w,
                  fontSize: roleFontSize ?? 19.sp),
            ),
            SizedBox(
              height: itemDistances ?? 4.h,
            ),
            SizedBox(
              //color: AppColors.blue,
              width: locationwidth ?? 270.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: locationIconSize ?? 20.sp,
                    color: AppColors.appBlue.withOpacity(0.5),
                  ),
                  Text(
                    "Palakkad,kerala,India",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.w,
                        fontSize: locationFontSize ?? 17.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: nameAndGridDistance ?? 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: gridhorizontalPadding ?? 70.w),
              child: SizedBox(
                // color: AppColors.brown,
                width: socialMediaGridWidth ?? 300.w,
                child: SocialMediaGridMenu(
                  crossAxisSpacing: 25.w,
                  mainAxisSpcaing: 25.h,
                  crossAxisCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
