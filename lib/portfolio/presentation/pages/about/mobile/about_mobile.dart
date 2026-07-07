import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/about_description_shimmer.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/certificate_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/education_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/experience_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/skills_listview.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMobile extends ConsumerStatefulWidget {
  const AboutMobile({super.key});

  @override
  ConsumerState<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends ConsumerState<AboutMobile>
    with TickerProviderStateMixin {
  bool certificationsVisible = false;
  bool skillsVisible = false;
  late AnimationController certificationAnimationController;
  late AnimationController skillsAnimationController;
  late Animation<Offset> certificationSlideAnimation;
  late Animation<Offset> skillsSlideAnimation;
  @override
  void initState() {
    certificationAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    certificationSlideAnimation =
        Tween<Offset>(begin: Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: certificationAnimationController,
            curve: Curves.easeOut,
          ),
        );
    skillsAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    skillsSlideAnimation =
        Tween<Offset>(begin: Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: skillsAnimationController,
            curve: Curves.easeOut,
          ),
        );
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
      padding: EdgeInsets.all(40.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: GoogleFonts.inter(
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.w,
                    fontSize: 50.sp,
                  ),
                ),
                SizedBox(height: 30.h),
                if (aboutState.isLoading)
                  const AboutDescriptionShimmer()
                else if (aboutDescription.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[850]!.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.1),
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        aboutDescription,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.inter(
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2.w,
                          fontSize: 45.sp,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30.w),
                    child: Text(
                      "About Not available",
                      style: GoogleFonts.inter(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 80.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Professional Experience",
                  style: GoogleFonts.inter(
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.w,
                    fontSize: 50.sp,
                  ),
                ),
                ExperienceMenu(
                  roleTitleSize: 46.sp,
                  companyNameSize: 45.sp,
                  descriptionSize: 45.sp,
                  bulletHeight: 1.2.h,
                  bulletSize: 80.sp,
                ),
                SizedBox(height: 55.h),
                VisibilityDetector(
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
                              fontSize: 50.sp,
                            ),
                          ),
                          CertificateDespTopMenu(
                            certificationSize: 45.sp,
                            bulletHeight: 1.25.h,
                            bulletSize: 60.sp,
                            builderWidth: double.infinity.w,
                          ),
                          SizedBox(height: 100.h),
                          Text(
                            "Education",
                            style: GoogleFonts.inter(
                              color: AppColors.appBlue,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.w,
                              fontSize: 50.sp,
                            ),
                          ),
                          EducationMenu(
                            instituteSize: 45.sp,
                            educationSize: 46.sp,
                            bulletHeight: 1.2.h,
                            bulletSize: 60.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 55.h),
                VisibilityDetector(
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
                              fontSize: 50.sp,
                            ),
                          ),
                          TechnicalSkillsMenu(
                            skillTitleSize: 46.sp,
                            skillSize: 45.sp,
                            bulletHeight: 1.2.h,
                            bulletSize: 60.sp,
                          ),
                          SizedBox(height: 30.h),
                          SoftSkillsMenu(
                            skillTitleSize: 46.sp,
                            skillSize: 45.sp,
                            bulletHeight: 1.2.h,
                            bulletSize: 60.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 50.h,
            // ),
            // Container(
            //   height: 80.h,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.w),
            //     color: AppColors.appBlue,
            //     gradient: LinearGradient(colors: [
            //       Theme.of(context).primaryColorDark,
            //       AppColors.lightBlack,
            //     ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            //   ),
            //   child: Center(
            //     child: SocialMediaGridMenu(
            //       listviewWidth: MediaQuery.of(context).size.width - 100,
            //       isListview: true,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
