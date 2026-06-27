import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class TechnicalSkillsMenu extends ConsumerWidget {
  const TechnicalSkillsMenu(
      {super.key,
      this.skillTitleSize,
      this.skillSize,
      this.bulletSize,
      this.bulletHeight,
      this.onAdminPress,
      this.isFromAdmin,
      this.onDelete});

  final double? skillTitleSize;
  final double? skillSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isFromAdmin;

  final Function(String)? onAdminPress;
  final Function(String)? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutState = ref.watch(aboutControllerProvider);
    final isAdmin = isFromAdmin ?? false;
    final technicalSkillsList = isAdmin
        ? (aboutState.updatedAboutResponseModel?.data.technicalSkills ?? [])
        : aboutState.technicalSkills;
    if (aboutState.isLoading) {
      return const SkillsShimmer(title: "Technical Skills");
    }

    if (technicalSkillsList.isEmpty) {
      return EmptySkills(title: "Technical Skills");
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900]!.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Technical Skills",
            style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              fontSize: skillTitleSize ?? 24.sp,
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: technicalSkillsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SkillsItem(
                skill: technicalSkillsList[index],
                skillSize: skillSize,
                bulletHeight: bulletHeight,
                bulletSize: bulletSize,
                isAdmin: isAdmin,
                onAdminPress: (String p1) {
                  if (onAdminPress != null) {
                    onAdminPress?.call(p1);
                  }
                },
                onDelete: (String p1) {
                  if (onDelete != null) {
                    onDelete?.call(p1);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class SoftSkillsMenu extends ConsumerWidget {
  const SoftSkillsMenu({
    super.key,
    this.skillTitleSize,
    this.skillSize,
    this.bulletSize,
    this.bulletHeight,
    this.onAdminPress,
    this.isFromAdmin,
    this.onDelete,
  });

  final double? skillTitleSize;
  final double? skillSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isFromAdmin;

  final Function(String)? onAdminPress;
  final Function(String)? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutState = ref.watch(aboutControllerProvider);
    final isAdmin = isFromAdmin ?? false;
    final softSkillsList = isAdmin
        ? (aboutState.updatedAboutResponseModel?.data.softSkills ?? [])
        : aboutState.softSkills;
    if (aboutState.isLoading) {
      return const SkillsShimmer(title: "Soft Skills");
    }

    if (softSkillsList.isEmpty) {
      return EmptySkills(title: "Soft Skills");
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900]!.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Soft\nSkills",
            style: GoogleFonts.inter(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              fontSize: skillTitleSize ?? 24.sp,
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            itemCount: softSkillsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SkillsItem(
                skill: softSkillsList[index],
                skillSize: skillSize,
                bulletHeight: bulletHeight,
                bulletSize: bulletSize,
                 isAdmin: isAdmin,
                onAdminPress: (String p1) {
                  if (onAdminPress != null) {
                    onAdminPress?.call(p1);
                  }
                },
                onDelete: (String p1) {
                  if (onDelete != null) {
                    onDelete?.call(p1);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class SkillsItem extends StatelessWidget {
  const SkillsItem({
    super.key,
    required this.skill,
    this.skillSize,
    this.bulletSize,
    this.bulletHeight,
     this.onAdminPress,
    this.isAdmin = false,
    this.onDelete,
  });

  final String skill;
  final double? skillSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isAdmin;
  final Function(String skillModal)? onDelete;
  final Function(String)? onAdminPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        if (onAdminPress != null) {
          onAdminPress?.call(skill);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[850]!.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.code_rounded,
              color: Theme.of(context).primaryColor,
              size: bulletSize ?? 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                skill,
                style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                  wordSpacing: 0.5.w,
                  height: 1.5.h,
                  fontSize: skillSize ?? 16.sp,
                ),
              ),
            ),
             isAdmin == true
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          if (onDelete != null) {
                            onDelete?.call(skill);
                          }
                        },
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: AppColors.red,
                        )),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

//shimmer and empty
class EmptySkills extends StatelessWidget {
  const EmptySkills({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.w),
      alignment: Alignment.center,
      child: Text(
        "No $title available",
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

class SkillsShimmer extends StatelessWidget {
  final String title;

  const SkillsShimmer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.h,
            width: 160.w,
            color: Colors.grey[700],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              return Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
