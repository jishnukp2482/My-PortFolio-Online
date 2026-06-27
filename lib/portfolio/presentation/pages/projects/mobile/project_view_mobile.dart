import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/domain/entities/projects/projects_modal.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/available_on.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/carousel_slider.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/key_features_builder.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/technologies_used_builder.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class ProjectViewMobile extends StatelessWidget {
  const ProjectViewMobile({super.key, required this.projectsModal});
  final ProjectData projectsModal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: Column(
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
                    size: 50.w,
                    color: AppColors.appBlue,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      projectsModal.projectName,
                      style: GoogleFonts.inter(
                        color: AppColors.appBlue,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.w,
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

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
                    height: 2,
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                    wordSpacing: 2.w,
                    fontSize: 45.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.all(30.w),
            child: CarouselImg(
              imagePadding: 50.w,
              imgs: projectsModal.imgUrls,
              height: 450.h,
              viewportFraction: 10.w,
              dotindicatorheight: 25,
              dotindicatorwidth: 25,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Key Features:",
            style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.w,
              fontSize: 46.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          KeyFeaturesMenu(
            iconSize: 50.w,
            projectsModal: projectsModal,
            keyFeaturesSize: 46.sp,
            bulletSize: 40.sp,
            bulletHeight: 1.2.h,
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Technologies Used:",
            style: GoogleFonts.inter(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.w,
                fontSize: 46.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          FrontendTechnologies(
            iconSize: 50.w,
            projectsModal: projectsModal,
            keyFeaturesSize: 46.sp,
            bulletSize: 40.sp,
            bulletHeight: 1.2.h,
          ),
          BackendTechnologies(
            iconSize: 50.w,
            projectsModal: projectsModal,
            keyFeaturesSize: 45.sp,
            bulletSize: 80.sp,
            bulletHeight: 1.2.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Available On:",
            style: GoogleFonts.inter(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.w,
                fontSize: 46.sp),
          ),
          AvailableOn(
            listviewSize: 100.h,
            containerSize: 200.w,
            projectModel: projectsModal,
            fetauresItemIconSize: 50.w,
            keyFeaturesSize: 45.sp,
            bulletSize: 80.sp,
            bulletHeight: 1.2.h,
            iconSize: 80.sp,
          )
        ],
      ),
    );
  }
}
