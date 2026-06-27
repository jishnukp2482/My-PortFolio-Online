import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:potfolio/portfolio/domain/entities/home/home_grid_modal.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/home/home_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/home/common/shimmer_icon.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class HomeGridDesktopMenu extends StatelessWidget {
  HomeGridDesktopMenu({super.key});

  final homeItemList = <HomeGridModal>[
    HomeGridModal(
        id: 1,
        title: "The Story So Far",
        subtitle: "Discover the journey that shaped who I am",
        icon: MdiIcons.accountArrowRightOutline,
        rawSpan: 1,
        columnPan: 2,
        ontap: () {}),
    HomeGridModal(
        id: 2,
        title: "Crafted Creations",
        subtitle: "A showcase of my proudest builds and ideas",
        icon: MdiIcons.apps,
        rawSpan: 2,
        columnPan: 1,
        ontap: () {}),
    HomeGridModal(
        id: 3,
        title: "Let’s Connect",
        subtitle: "Reach out and make something amazing happen",
        icon: Icons.contact_mail_outlined,
        rawSpan: 1,
        columnPan: 1,
        ontap: () {}),
    HomeGridModal(
        id: 4,
        title: "Your Next Collaborator",
        subtitle: "Ready to bring your vision to life",
        icon: MdiIcons.progressHelper,
        rawSpan: 1,
        columnPan: 1,
        ontap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final pattern = homeItemList
        .map(
          (e) => QuiltedGridTile(e.rawSpan, e.columnPan),
        )
        .toList();
    return SizedBox(
      //color: AppColors.green,
      // height: 600.h,
      width: 750.w,
      child: GridView.custom(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 10.w,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: pattern),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: homeItemList.length,
            (context, index) {
              final item = homeItemList[index];
              return HomeGridItem(homeGridModal: item);
            },
          )),
    );
  }
}

class HomeGridItem extends ConsumerStatefulWidget {
  const HomeGridItem({super.key, required this.homeGridModal});
  final HomeGridModal homeGridModal;

  @override
  ConsumerState<HomeGridItem> createState() => _HomeGridItemState();
}

class _HomeGridItemState extends ConsumerState<HomeGridItem>
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
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
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
    final homeCntlr = ref.read(homeControllerProvider.notifier);

    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: () => homeCntlr.selectBody(
          widget.homeGridModal.id,
        ),
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColorDark,
                AppColors.lightBlack,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ishovered == true
                    ? ShimmerIcon(
                        icon: widget.homeGridModal.icon,
                        iconsize: 28.sp,
                      )
                    : Icon(
                        widget.homeGridModal.icon,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        size: 27.sp,
                      ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.h,
                    children: [
                      Text(
                        widget.homeGridModal.title,
                        style: GoogleFonts.nunitoSans(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.homeGridModal.subtitle,
                        style: GoogleFonts.nunitoSans(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.35),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
