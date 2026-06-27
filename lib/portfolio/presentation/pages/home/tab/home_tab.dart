import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/widgets/appbar.dart';
import 'package:potfolio/portfolio/presentation/pages/home/desktop/home_grid_desktop.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // color: AppColors.blue,
                height: 600.h,
                width: 550.w,
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
                          fontSize: 50.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "I'M A Flutter\nDeveloper",
                          textStyle: GoogleFonts.nunitoSans(
                              color: Color(0xffB1DDF1),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 8.w,
                              fontSize: 65.sp),
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
              HomeGridDesktopMenu(),
            ],
          ),
        ],
      ),
    );
  }
}
