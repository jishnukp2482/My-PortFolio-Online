import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:potfolio/portfolio/domain/entities/home/app_bar_title_modal.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/home/home_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/main/main_page.dart';
import 'package:potfolio/portfolio/presentation/themes/app_assets.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class HomeAppBar extends ConsumerStatefulWidget {
  const HomeAppBar({super.key, required this.isMobileAppbar});
  final bool isMobileAppbar;
  @override
  ConsumerState<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends ConsumerState<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController buttonAnimationController;
  late Animation<double> scaleAnimation;
  bool isbuttonHovered = false;

  @override
  void initState() {
    buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
        parent: buttonAnimationController, curve: Curves.easeInOut));
    super.initState();
  }

  @override
  void dispose() {
    buttonAnimationController.dispose();
    super.dispose();
  }

  void isHover(bool value) {
    setState(() {
      isbuttonHovered = value;
      if (isbuttonHovered) {
        buttonAnimationController.forward();
      } else {
        buttonAnimationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainPageState = MainPage.mainPagekey.currentState;
    final isDrawerOpen = mainPageState?.isDrawerOpen ?? false;
    final aboutController = ref.read(aboutControllerProvider.notifier);
    final aboutState = ref.watch(aboutControllerProvider);
    ref.listen(aboutControllerProvider, (previous, next) {
      if (next.errorMsg != null && next.errorMsg!.isNotEmpty) {
        bottomMsg(context, next.errorMsg ?? "");
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
          onEnter: (event) => isHover(true),
          onExit: (event) => isHover(false),
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: SizedBox(
                  height: 35.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                    ),
                    onPressed: aboutState.isLoading
                        ? null
                        : () {
                            aboutController.downloadResume(false);
                          },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                      child: aboutState.isLoading
                          ? Row(
                              key: const ValueKey("loading"),
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 23.w,
                                ),
                                SizedBox(
                                  height: 35.h,
                                  child: Lottie.asset(AppAssets.loader,
                                      fit: BoxFit.fill),
                                ),
                                SizedBox(
                                  width: 23.w,
                                ),
                              ],
                            )
                          : Row(
                              key: const ValueKey("normal"),
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Resume",
                                  style: GoogleFonts.nunitoSans(
                                    color: isbuttonHovered
                                        ? AppColors.appBlue
                                        : Theme.of(context).primaryColor,
                                    fontSize:
                                        widget.isMobileAppbar ? 30.sp : 18.sp,
                                    letterSpacing: 2.w,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.download,
                                  color: isbuttonHovered
                                      ? AppColors.appBlue
                                      : Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        widget.isMobileAppbar
            ? IconButton(
                onPressed: () {
                  if (isDrawerOpen) {
                    mainPageState?.closeDrawer();
                  } else {
                    mainPageState?.openDrawer();
                  }
                },
                icon: Icon(
                  isDrawerOpen ? Icons.close_rounded : Icons.menu_outlined,
                  color: Theme.of(context).primaryColor,
                ))
            : AppBarTitleMenu(
                isMobileAppBarTitleMenu: false,
              ),
      ],
    );
  }
}

class AppBarTitleMenu extends ConsumerStatefulWidget {
  const AppBarTitleMenu({super.key, required this.isMobileAppBarTitleMenu});
  final bool isMobileAppBarTitleMenu;
  @override
  ConsumerState<AppBarTitleMenu> createState() => _AppBarTitleMenuState();
}

class _AppBarTitleMenuState extends ConsumerState<AppBarTitleMenu> {
  final titleList = <AppBarTitleModal>[
    AppBarTitleModal(icon: MdiIcons.home, title: "Home", ontap: () {}, id: 0),
    AppBarTitleModal(
        icon: MdiIcons.accountArrowRightOutline,
        title: "About",
        ontap: () {},
        id: 1),
    AppBarTitleModal(
        icon: MdiIcons.apps, title: "Projects", ontap: () {}, id: 2),
    AppBarTitleModal(
        icon: Icons.contact_mail_outlined,
        title: "Contacts",
        ontap: () {},
        id: 3),
  ];
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final mainPageState = MainPage.mainPagekey.currentState;
    final isDrawerOpen = mainPageState?.isDrawerOpen ?? false;
    final homeController = ref.read(homeControllerProvider.notifier);
    final homeState = ref.watch(homeControllerProvider);
    return widget.isMobileAppBarTitleMenu
        ? Drawer(
            backgroundColor: AppColors.backgroundcolor,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: titleList.length,
              itemBuilder: (context, index) {
                return MouseRegion(
                  onEnter: (event) => setState(() => hoveredIndex = index),
                  onExit: (event) => setState(() => hoveredIndex = null),
                  child: GestureDetector(
                    onTap: () {
                      customPrint("id mobile==${titleList[index].id}");

                      homeController.selectBody(
                        titleList[index].id,
                      );
                      if (isDrawerOpen) {
                        mainPageState?.closeDrawer();
                      }
                    },
                    child: AppBarTitleMobileItem(
                      appBarTitleModal: titleList[index],
                      color: homeState.body == titleList[index].id ||
                              hoveredIndex == index
                          ? AppColors.appBlue
                          : Theme.of(context).primaryColor,
                      fontsize: 55.sp,
                      verticalpaddingAll: 10.h,
                    ),
                  ),
                );
              },
            ),
          )
        : SizedBox(
            height: 50.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: titleList.length,
              itemBuilder: (context, index) {
                return MouseRegion(
                  onEnter: (event) => setState(() => hoveredIndex = index),
                  onExit: (event) => setState(() => hoveredIndex = null),
                  child: GestureDetector(
                    onTap: () {
                      customPrint("id==${titleList[index].id}");
                      homeController.selectBody(
                        titleList[index].id,
                      );
                    },
                    child: AppBarTitleItem(
                      appBarTitleModal: titleList[index],
                      color: homeState.body == titleList[index].id ||
                              hoveredIndex == index
                          ? AppColors.appBlue
                          : Theme.of(context).primaryColor,
                      fontsize: 18.sp,
                      horizontalpaddingAll: 24.w,
                    ),
                  ),
                );
              },
            ),
          );
  }
}

class AppBarTitleItem extends StatefulWidget {
  const AppBarTitleItem(
      {super.key,
      required this.appBarTitleModal,
      required this.color,
      required this.fontsize,
      this.horizontalpaddingAll,
      this.verticalpaddingAll});
  final AppBarTitleModal appBarTitleModal;
  final Color color;
  final double fontsize;
  final double? horizontalpaddingAll;
  final double? verticalpaddingAll;

  @override
  State<AppBarTitleItem> createState() => _AppBarTitleItemState();
}

class _AppBarTitleItemState extends State<AppBarTitleItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalpaddingAll ?? 0,
          vertical: widget.verticalpaddingAll ?? 0),
      child: Text(
        widget.appBarTitleModal.title,
        style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w500,
            fontSize: widget.fontsize,
            color: widget.color),
      ),
    );
  }
}

class AppBarTitleMobileItem extends StatefulWidget {
  const AppBarTitleMobileItem(
      {super.key,
      required this.appBarTitleModal,
      required this.color,
      required this.fontsize,
      this.horizontalpaddingAll,
      this.verticalpaddingAll});
  final AppBarTitleModal appBarTitleModal;
  final Color color;
  final double fontsize;
  final double? horizontalpaddingAll;
  final double? verticalpaddingAll;

  @override
  State<AppBarTitleMobileItem> createState() => _AppBarTitleMobileItemState();
}

class _AppBarTitleMobileItemState extends State<AppBarTitleMobileItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalpaddingAll ?? 0,
          vertical: widget.verticalpaddingAll ?? 0),
      child: ListTile(
        leading: Icon(
          widget.appBarTitleModal.icon,
          color: widget.color,
        ),
        title: Text(
          widget.appBarTitleModal.title,
          style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w500,
              fontSize: widget.fontsize,
              color: widget.color),
        ),
      ),
    );
  }
}
