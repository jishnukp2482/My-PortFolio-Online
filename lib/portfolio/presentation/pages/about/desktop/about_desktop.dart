import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/certificate_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/education_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/experience_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/skills_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/socialmedia_grid.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutDesktop extends ConsumerStatefulWidget {
  const AboutDesktop({super.key});

  @override
  ConsumerState<AboutDesktop> createState() => _AboutDesktopState();
}

class _AboutDesktopState extends ConsumerState<AboutDesktop>
    with TickerProviderStateMixin {
  bool certificationsVisible = false;
  bool skillsVisible = false;
  late AnimationController certificationAnimationController;
  late AnimationController skillsAnimationController;
  late Animation<Offset> certificationSlideAnimation;
  late Animation<Offset> skillsSlideAnimation;
  @override
  void initState() {
    certificationAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    certificationSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: certificationAnimationController, curve: Curves.easeOut));
    skillsAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    skillsSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: skillsAnimationController, curve: Curves.easeOut));
    super.initState();
  }

  void onvisibityChanged(String section, bool isvisible) {
    if (section == "certifications" && isvisible && !certificationsVisible) {
      setState(() {
        certificationsVisible = true;
        certificationAnimationController.forward();
      });
    } else if (section == "skills" && isvisible && !skillsVisible) {
      setState(() {
        skillsVisible = true;
        skillsAnimationController.forward();
      });
    }
  }

  @override
  void dispose() {
    skillsAnimationController.dispose();
    certificationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aboutState = ref.watch(aboutControllerProvider);
    String aboutDescription =
        aboutState.aboutResponseModel?.data.aboutDescription ?? "";
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // color: AppColors.appBlue,
                  height: 660.h,
                  width: 450.w,
                  child: SizedBox(
                    height: 590.h,
                    width: 450.w,
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColorDark,
                            AppColors.lightBlack,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Decorative elements
                          Positioned(
                            top: 20.h,
                            right: 10.w,
                            child: Icon(
                              Icons.circle,
                              size: 40.w,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ),
                          ),
                          Positioned(
                            bottom: 20.h,
                            left: 15.w,
                            child: Icon(
                              Icons.circle,
                              size: 40.w,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.h),
                              Text(
                                "Let's Connect",
                                style: GoogleFonts.dancingScript(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.w,
                                  fontSize: 36.sp,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0,
                                      color: Colors.white.withOpacity(0.3),
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "Get in touch with me through",
                                style: GoogleFonts.roboto(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.w,
                                ),
                              ),
                              Text(
                                "any of these platforms",
                                style: GoogleFonts.roboto(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.w,
                                ),
                              ),
                              SizedBox(height: 30.h),
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 95.w),
                                    child: SocialMediaGridMenu(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "I'd love to hear from you!",
                                style: GoogleFonts.roboto(
                                  color: Colors.white60,
                                  fontSize: 12.sp,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  //color: AppColors.green,
                  width: 800.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: GoogleFonts.inter(
                            color: AppColors.appBlue,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.w,
                            fontSize: 25.sp),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      aboutDescription.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[850]!.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(16.w),
                                child: Text(
                                  aboutDescription,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.8),
                                      fontWeight: FontWeight.w400,
                                      wordSpacing: 2.w,
                                      fontSize: 17.sp),
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(30.w),
                              child: Text(
                                "About Not available",
                                style: GoogleFonts.inter(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Text(
                        "Professional Experience",
                        style: GoogleFonts.inter(
                            color: AppColors.appBlue,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.w,
                            fontSize: 25.sp),
                      ),
                      ExperienceMenu(),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 145.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: VisibilityDetector(
                    key: const Key('certifications-section'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.2) {
                        onvisibityChanged("certifications", true);
                      }
                    },
                    child: SlideTransition(
                      position: certificationSlideAnimation,
                      child: AnimatedOpacity(
                        opacity: certificationsVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 600),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Certifications",
                              style: GoogleFonts.inter(
                                  color: AppColors.appBlue,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.w,
                                  fontSize: 25.sp),
                            ),
                            CertificateDespTopMenu(),
                            SizedBox(
                              height: 100.h,
                            ),
                            Text(
                              "Education",
                              style: GoogleFonts.inter(
                                  color: AppColors.appBlue,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.w,
                                  fontSize: 25.sp),
                            ),
                            EducationMenu(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: VisibilityDetector(
                    key: const Key('skills-section'),
                    onVisibilityChanged: (info) {
                      if (info.visibleFraction > 0.2) {
                        onvisibityChanged("skills", true);
                      }
                    },
                    child: SlideTransition(
                      position: skillsSlideAnimation,
                      child: AnimatedOpacity(
                        opacity: skillsVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 600),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Skills",
                              style: GoogleFonts.inter(
                                  color: AppColors.appBlue,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.w,
                                  fontSize: 25.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: TechnicalSkillsMenu()),
                                Expanded(child: SoftSkillsMenu()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
