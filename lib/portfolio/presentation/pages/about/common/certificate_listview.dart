import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class CertificateDespTopMenu extends ConsumerWidget {
  const CertificateDespTopMenu(
      {super.key,
      this.certificationSize,
      this.bulletSize,
      this.bulletHeight,
      this.builderWidth,
      this.onAdminPress,
      this.isFromAdmin,
      this.onDelete});

  final double? certificationSize;
  final double? bulletSize;
  final double? bulletHeight;
  final double? builderWidth;
  final bool? isFromAdmin;

  final Function(Certification)? onAdminPress;
  final Function(Certification)? onDelete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutState = ref.watch(aboutControllerProvider);
    final isAdmin = isFromAdmin ?? false;
    final List<Certification> certificateList = isAdmin
        ? (aboutState.updatedAboutResponseModel?.data.certifications ?? [])
        : aboutState.certifications;
    if (aboutState.isLoading) {
      return const CertificateShimmer();
    }

    /// Empty
    if (certificateList.isEmpty) {
      return _emptyState(context);
    }
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundcolor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10.r,
            spreadRadius: 2.r,
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
            itemCount: certificateList.length,
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              height: 32.h,
            ),
            itemBuilder: (context, index) {
              return CertificateDeskTopItem(
                certificateModal: certificateList[index],
                certificationSize: certificationSize,
                bulletHeight: bulletHeight,
                bulletSize: bulletSize,
                isAdmin: isAdmin,
                onAdminPress: (Certification p1) {
                  if (onAdminPress != null) {
                    onAdminPress?.call(p1);
                  }
                },
                onDelete: (Certification p1) {
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
      padding: EdgeInsets.all(30.w),
      alignment: Alignment.center,
      child: Text(
        "No certifications available",
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

class CertificateDeskTopItem extends StatelessWidget {
  const CertificateDeskTopItem({
    super.key,
    required this.certificateModal,
    this.certificationSize,
    this.bulletSize,
    this.bulletHeight,
    this.onAdminPress,
    this.isAdmin = false,
    this.onDelete,
  });

  final Certification certificateModal;
  final double? certificationSize;
  final double? bulletSize;
  final double? bulletHeight;
  final bool? isAdmin;
  final Function(Certification certificateModal)? onDelete;
  final Function(Certification)? onAdminPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onAdminPress != null) {
          onAdminPress?.call(certificateModal);
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.verified_outlined,
              size: bulletSize ?? 22.sp,
              color: AppColors.white,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificateModal.title,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1.5.w,
                      height: 1.6.h,
                      fontSize: certificationSize ?? 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      certificateModal.year,
                      style: GoogleFonts.inter(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: (certificationSize ?? 16.sp) - 2.sp,
                      ),
                    ),
                  ),
                  isAdmin == true
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                if (onDelete != null) {
                                  onDelete?.call(certificateModal);
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
          ],
        ),
      ),
    );
  }
}

///shimmer
class CertificateShimmer extends StatelessWidget {
  const CertificateShimmer({super.key});

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
            child: Row(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 14.h,
                        width: 200.w,
                        color: Colors.grey[700],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 12.h,
                        width: 80.w,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
