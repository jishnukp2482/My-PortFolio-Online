import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/appbar.dart';
import 'package:potfolio/portfolio/presentation/pages/home/mobile/home_grid_mobile.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                // color: AppColors.blue,
                height: 300.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.w,
                          fontSize: 100.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "I'M A Flutter\nDeveloper",
                          textStyle: GoogleFonts.nunitoSans(
                            color: Color(0xffB1DDF1),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 8.w,
                            fontSize: 120.sp,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      totalRepeatCount: 3,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      // repeatForever: true,
                      stopPauseOnTap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: HomeGridMobileMenu(),
          ),
        ],
      ),
    );
  }
}
