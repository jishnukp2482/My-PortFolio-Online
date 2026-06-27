
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class ExperienceMenu extends ConsumerWidget {
  const ExperienceMenu(
      {super.key,
      this.roleTitleSize,
      this.companyNameSize,
      this.descriptionSize,
      this.bulletSize,
      this.bulletHeight,
      this.onAdminPress,
      this.isFromAdmin,
      this.onDelete});

  final double? roleTitleSize;
  final double? companyNameSize;
  final double? descriptionSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isFromAdmin;

  final Function(ProfessionalExperience)? onAdminPress;
  final Function(ProfessionalExperience)? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutState = ref.watch(aboutControllerProvider);
    final isAdmin = isFromAdmin ?? false;

    final List<ProfessionalExperience> experienceList = isAdmin
        ? (aboutState.updatedAboutResponseModel?.data.professionalExperience ??
            [])
        : aboutState.professionalExperience;
    if (aboutState.isLoading) {
      return const ExperienceShimmer();
    }

    /// Empty
    if (experienceList.isEmpty) {
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
            itemCount: experienceList.length,
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              height: 32.h,
            ),
            itemBuilder: (context, index) {
              return ExperienceItem(
                experienceModal: experienceList[index],
                descriptionSize: descriptionSize,
                roleTitleSize: roleTitleSize,
                companyNameSize: companyNameSize,
                bulletHeight: bulletHeight,
                bulletSize: bulletSize,
                isAdmin: isAdmin,
                onAdminPress: (ProfessionalExperience p1) {
                  if (onAdminPress != null) {
                    onAdminPress?.call(p1);
                  }
                },
                onDelete: (ProfessionalExperience p1) {
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
        "No professional experience available",
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.experienceModal,
    this.roleTitleSize,
    this.companyNameSize,
    this.descriptionSize,
    this.bulletSize,
    this.bulletHeight,
   this.onAdminPress,
    this.isAdmin = false,
    this.onDelete,
  });

  final ProfessionalExperience experienceModal;
  final double? roleTitleSize;
  final double? companyNameSize;
  final double? descriptionSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isAdmin;
  final Function(ProfessionalExperience professionalExperience)? onDelete;
  final Function(ProfessionalExperience)? onAdminPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onAdminPress != null) {
          onAdminPress?.call(experienceModal);
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
                // Custom bullet point with gradient

                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experienceModal.role,
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.95),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5.w,
                          fontSize: roleTitleSize ?? 18.sp,
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
                          experienceModal.duration,
                          style: GoogleFonts.inter(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: (roleTitleSize ?? 18.sp) - 2.sp,
                            letterSpacing: 0.5.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Icon(
                  Icons.business_outlined,
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    experienceModal.companyName,
                    style: GoogleFonts.inter(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5.w,
                      fontSize: companyNameSize ?? 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                experienceModal.description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  wordSpacing: 1.5.w,
                  fontSize: descriptionSize ?? 15.sp,
                  height: 1.6.h,
                ),
              ),
            ),
            isAdmin == true
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          if (onDelete != null) {
                            onDelete?.call(experienceModal);
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

//shimmer
class ExperienceShimmer extends StatelessWidget {
  const ExperienceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
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
                /// Role title
                Container(
                  height: 18.h,
                  width: 180.w,
                  color: Colors.grey[700],
                ),

                SizedBox(height: 10.h),

                /// Duration badge
                Container(
                  height: 14.h,
                  width: 90.w,
                  color: Colors.grey[700],
                ),

                SizedBox(height: 16.h),

                /// Company name row
                Row(
                  children: [
                    Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 14.h,
                      width: 150.w,
                      color: Colors.grey[700],
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                /// Description box
                Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(6),
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
