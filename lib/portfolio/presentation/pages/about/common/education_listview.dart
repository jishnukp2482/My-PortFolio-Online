import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/domain/entities/about/education/education_modal.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class EducationMenu extends ConsumerWidget {
  const EducationMenu(
      {super.key,
      this.educationSize,
      this.instituteSize,
      this.bulletSize,
      this.bulletHeight,
      this.onAdminPress,
      this.isFromAdmin,
      this.onDelete});

  final double? educationSize;
  final double? instituteSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isFromAdmin;

  final Function(Education)? onAdminPress;
  final Function(Education)? onDelete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutState = ref.watch(aboutControllerProvider);
    final isAdmin = isFromAdmin ?? false;
    final List<Education> educationList = isAdmin
        ? (aboutState.updatedAboutResponseModel?.data.educations ?? [])
        : aboutState.educations;
    if (aboutState.isLoading) {
      return const EducationShimmer();
    }

    /// Empty
    if (educationList.isEmpty) {
      return _emptyState(context);
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
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: educationList.length,
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              height: 32.h,
            ),
            itemBuilder: (context, index) {
              return EducationDeskTopItem(
                educationModal: educationList[index],
                instituteSize: instituteSize,
                educationSize: educationSize,
                bulletHeight: bulletHeight,
                bulletSize: bulletSize,
                isAdmin: isAdmin,
                onAdminPress: (Education p1) {
                  if (onAdminPress != null) {
                    onAdminPress?.call(p1);
                  }
                },
                onDelete: (Education p1) {
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

  Widget _emptyState(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30.w),
      child: Text(
        "No education details available",
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

class EducationDeskTopItem extends StatelessWidget {
  const EducationDeskTopItem({
    super.key,
    required this.educationModal,
    this.educationSize,
    this.instituteSize,
    this.bulletSize,
    this.bulletHeight,
    this.onAdminPress,
    this.isAdmin = false,
    this.onDelete,
  });

  final Education educationModal;
  final double? educationSize;
  final double? instituteSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isAdmin;
  final Function(Education educationModal)? onDelete;
  final Function(Education)? onAdminPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onAdminPress != null) {
          onAdminPress?.call(educationModal);
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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: bulletSize ?? 22.sp,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        educationModal.title,
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.95),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5.w,
                          fontSize: educationSize ?? 18.sp,
                          height: 1.4.h,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          educationModal.year,
                          style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: (educationSize ?? 18.sp) - 2.sp,
                            letterSpacing: 0.5.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Row(
                children: [
                  Icon(
                    Icons.school_outlined,
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    size: 16.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      educationModal.institute,
                      style: GoogleFonts.inter(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5.w,
                        fontSize: instituteSize ?? 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isAdmin == true
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          if (onDelete != null) {
                            onDelete?.call(educationModal);
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

///shimmer
class EducationShimmer extends StatelessWidget {
  const EducationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (_, __) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.grey[800]!.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Container(
                        height: 16.h,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 80.w,
                  height: 14.h,
                  color: Colors.grey[700],
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: Container(
                    height: 14.h,
                    width: 160.w,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
