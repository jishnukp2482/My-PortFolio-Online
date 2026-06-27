import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/project/project_controller.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:shimmer/shimmer.dart';

class ProjectsGridMenu extends ConsumerWidget {
  const ProjectsGridMenu({
    super.key,
    this.crossAxisCount,
    this.imgContainerHeight,
    this.projectNameSize,
    this.subttileOverViewSize,
    this.maxLines,
    this.distance,
    this.childAspectRatio,
    this.titileDistance,
    this.isMobile = false,
    this.onAdminPress,
    this.isFromAdmin,
    this.onDelete,
  });
  final int? crossAxisCount;
  final double? imgContainerHeight;
  final double? projectNameSize;
  final double? subttileOverViewSize;
  final int? maxLines;
  final double? distance;
  final double? childAspectRatio;
  final double? titileDistance;
  final bool? isMobile;
  final bool? isFromAdmin;

  final Function(ProjectData)? onAdminPress;
  final Function(ProjectData)? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = isFromAdmin ?? false;
    final projectState = ref.watch(projectControllerProvider);
    final projectsList = projectState.projects ?? [];
    if (projectState.isLoading) {
      return const ProjectShimmerGrid();
    }

    /// ✅ EMPTY STATE
    if (projectsList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Icon(Icons.folder_open, size: 80.sp, color: AppColors.grey),
            SizedBox(height: 20.h),
            Text(
              "No Projects Available",
              style: GoogleFonts.nunitoSans(
                fontSize: 22.sp,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Please check back later",
              style: GoogleFonts.nunitoSans(
                fontSize: 14.sp,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 3,
        crossAxisSpacing: 70.w,
        mainAxisSpacing: 70.h,
        childAspectRatio: childAspectRatio ?? 1,
      ),
      itemCount: projectsList.length,
      itemBuilder: (context, index) {
        return ProjectItem(
          projectsModal: projectsList[index],
          imgContainerHeight: imgContainerHeight,
          projectNameSize: projectNameSize,
          subttileOverViewSize: subttileOverViewSize,
          maxLines: maxLines,
          distance: distance,
          titileDistance: titileDistance,
          isMobile: false,
          isAdmin: isAdmin,
          onAdminPress: (ProjectData p1) {
            if (onAdminPress != null) {
              onAdminPress?.call(p1);
            }
          },
          onDelete: (ProjectData p1) {
            if (onDelete != null) {
              onDelete?.call(p1);
            }
          },
        );
      },
    );
  }
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    required this.projectsModal,
    this.imgContainerHeight,
    this.projectNameSize,
    this.subttileOverViewSize,
    this.maxLines,
    this.distance,
    this.titileDistance,
    this.isMobile = false,
    this.onAdminPress,
    this.isAdmin = false,
    this.onDelete,
  });
  final ProjectData projectsModal;
  final double? imgContainerHeight;
  final double? projectNameSize;
  final double? subttileOverViewSize;
  final int? maxLines;
  final double? distance;
  final double? titileDistance;
  final bool? isMobile;
  final bool? isAdmin;
  final Function(ProjectData projectData)? onDelete;
  final Function(ProjectData)? onAdminPress;
  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  bool isHovered = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onHover(bool isHovering) {
    setState(() {
      isHovered = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: GestureDetector(
        onTap: () => GoRouter.of(
          context,
        ).pushNamed(AppPages.projectsView, extra: widget.projectsModal),
        onDoubleTap: () {
          if (widget.onAdminPress != null) {
            widget.onAdminPress?.call(widget.projectsModal);
          }
        },
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: isHovered ? AppColors.appBlue : AppColors.transparent,
              ),
              borderRadius: BorderRadius.circular(20.w),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorDark,
                  AppColors.lightBlack,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: widget.imgContainerHeight ?? 200.h,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: widget.projectsModal.imgUrls.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: widget.projectsModal.imgUrls.length > 2
                              ? widget.projectsModal.imgUrls[2].imgUrl
                              : widget.projectsModal.imgUrls.first.imgUrl,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.w),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColorDark,
                                  AppColors.lightBlack,
                                  AppColors.lightBlack,
                                  AppColors.lightBlack,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) {
                            customPrint(
                              "❌ FAILED IMAGE->${widget.projectsModal.imgUrls.first.imgUrl}",
                            );
                            customPrint("URL: $url");
                            customPrint("ERROR: $error");

                            return const Icon(Icons.error);
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: Colors.white.withOpacity(0.05),
                            border: Border.all(color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.white54,
                              size: 40.sp,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: widget.titileDistance ?? 25.h),
                Text(
                  widget.projectsModal.projectName,
                  style: GoogleFonts.nunitoSans(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    fontSize: widget.projectNameSize ?? 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: widget.distance ?? 10.h),
                Text(
                  widget.projectsModal.subDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: widget.maxLines ?? 3,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.nunitoSans(
                    color: Theme.of(context).primaryColor.withOpacity(0.35),
                    fontSize: widget.subttileOverViewSize ?? 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                widget.isAdmin == true
                    ? Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white24),
                              ),
                              child: Text(
                                "${widget.projectsModal.order}",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (widget.onDelete != null) {
                                  widget.onDelete?.call(widget.projectsModal);
                                }
                              },
                              icon: Icon(
                                Icons.delete_outline_outlined,
                                color: AppColors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///shimmer
class ProjectShimmerGrid extends StatelessWidget {
  const ProjectShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6, // 👈 number of shimmer items
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 70.w,
        mainAxisSpacing: 70.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return const ProjectShimmerItem();
      },
    );
  }
}

class ProjectShimmerItem extends StatelessWidget {
  const ProjectShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.05),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColorDark, AppColors.lightBlack],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 🔥 Image shimmer (same size)
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.w),
              ),
            ),

            SizedBox(height: 25.h),

            /// 🔥 Title shimmer
            Container(height: 20.h, width: 120.w, color: Colors.grey),

            SizedBox(height: 10.h),

            /// 🔥 Subtitle lines shimmer
            Container(height: 12.h, width: double.infinity, color: Colors.grey),
            SizedBox(height: 8.h),
            Container(height: 12.h, width: double.infinity, color: Colors.grey),
            SizedBox(height: 8.h),
            Container(height: 12.h, width: 150.w, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
