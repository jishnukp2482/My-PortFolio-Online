import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:potfolio/portfolio/domain/entities/admin/dashboard_grid_model.dart';
import 'package:potfolio/portfolio/presentation/pages/home/common/shimmer_icon.dart';
import 'package:potfolio/portfolio/presentation/routes/LocalStorageNames.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Center(child: DashboardGridView())),
    );
  }
}

class DashboardGridView extends StatelessWidget {
  DashboardGridView({super.key});
  final dashboardItems = <DashboardGridModel>[
    DashboardGridModel(
      title: "Update About",
      id: 1,
      icon: MdiIcons.accountEditOutline,
      ontap: (context) {
        GoRouter.of(context).go(AppPages.updateAbout);
      },
    ),
    DashboardGridModel(
      title: "Upload Resume",
      id: 2,
      icon: MdiIcons.fileUploadOutline,
      ontap: (context) {
        GoRouter.of(context).go(AppPages.uploadResume);
      },
    ),
    DashboardGridModel(
      title: "Contact",
      id: 4,
      icon: MdiIcons.accountEditOutline,
      ontap: (context) {
        GoRouter.of(context).go(AppPages.updateContact);
      },
    ),
    DashboardGridModel(
      title: "Project",
      id: 6,
      icon: MdiIcons.folderPlusOutline,
      ontap: (context) {
        GoRouter.of(context).go(AppPages.updateProject);
      },
    ),
    DashboardGridModel(
      title: "Logout",
      id: 7,
      icon: MdiIcons.logout,
      ontap: (context) {
        GoRouter.of(context).go(AppPages.updateProject);
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: dashboardItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final item = dashboardItems[index];
        return DashboardGridItem(dashboardGridModel: item);
      },
    );
  }
}

class DashboardGridItem extends StatefulWidget {
  const DashboardGridItem({super.key, required this.dashboardGridModel});
  final DashboardGridModel dashboardGridModel;

  @override
  State<DashboardGridItem> createState() => _DashboardGridItemState();
}

class _DashboardGridItemState extends State<DashboardGridItem>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  bool ishovered = false;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    super.initState();
    scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onHover(bool isHovering) {
    setState(() {
      ishovered = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: () {
          if (widget.dashboardGridModel.id == 7) {
            showLogoutDialog(context);
          } else {
            widget.dashboardGridModel.ontap(context);
          }
        },
        child: ScaleTransition(
          scale: scaleAnimation,
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
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: ishovered == true
                        ? ShimmerIcon(
                            icon: widget.dashboardGridModel.icon,
                            iconsize: 58.sp,
                          )
                        : Icon(
                            widget.dashboardGridModel.icon,
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.5),
                            size: 37.sp,
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.h,
                    children: [
                      Text(
                        widget.dashboardGridModel.title,
                        style: GoogleFonts.nunitoSans(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.8),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showLogoutDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          contentPadding: EdgeInsets.zero,
          content: Container(
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
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.logout_rounded, color: Colors.white, size: 40.w),
                SizedBox(height: 15.h),

                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  "Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),

                SizedBox(height: 25.h),

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14.w),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.w),
                            color: Colors.white.withOpacity(.08),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14.w),
                        onTap: () async {
                          final storage = GetStorage();

                          await storage.remove(LocalStorageKeys.accessTokenKEY);

                          await storage.remove(
                            LocalStorageKeys.refreshTokenKEY,
                          );

                          if (context.mounted) {
                            context.go(AppPages.mainScreen);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.w),
                            color: Colors.redAccent.withOpacity(.18),
                            border: Border.all(
                              color: Colors.redAccent.withOpacity(.4),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
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
      },
    );
  }
}
