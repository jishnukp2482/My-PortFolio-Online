import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/available_on.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/carousel_slider.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/key_features_builder.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/technologies_used_builder.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class ProjectViewDesktop extends StatelessWidget {
  const ProjectViewDesktop({super.key, required this.projectsModal});
  final ProjectData projectsModal;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Name with icon
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.app_shortcut_outlined,
                  size: 28.w,
                  color: AppColors.appBlue,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    projectsModal.projectName,
                    style: GoogleFonts.inter(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2.w,
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Overview in a modern card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.1),
                    Theme.of(context).primaryColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4.w),
                  ),
                ],
              ),
              child: Text(
                projectsModal.projectDescription,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                  height: 1.9,
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                  wordSpacing: 1.8.w,
                  fontSize: 16.sp,
                  letterSpacing: 0.25.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        CarouselImg(imgs: projectsModal.imgUrls),
        SizedBox(
          height: 40.h,
        ),
        Text(
          "Key Features:",
          style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.w,
              fontSize: 19.sp),
        ),
        KeyFeaturesMenu(projectsModal: projectsModal),
        SizedBox(
          height: 40.h,
        ),
        Text(
          "Technologies Used:",
          style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.w,
              fontSize: 19.sp),
        ),
        FrontendTechnologies(projectsModal: projectsModal),
        BackendTechnologies(
          projectsModal: projectsModal,
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          "Available On:",
          style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.w,
              fontSize: 19.sp),
        ),
        AvailableOn(projectModel: projectsModal)
      ],
    );
  }
}
