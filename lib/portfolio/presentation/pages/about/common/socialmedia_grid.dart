import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/fetch_contacts_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/contact/contact_controller.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';

class SocialMediaGridMenu extends ConsumerWidget {
  const SocialMediaGridMenu({
    super.key,
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpcaing,
    this.isListview = false,
    this.listviewWidth,
    this.childAspectRatio,
    this.onAdminPress,
    this.isFromAdmin,
    this.onDelete,
  });

  final int? crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpcaing;
  final double? listviewWidth;
  final double? childAspectRatio;
  final bool? isListview;
  final bool? isFromAdmin;

  final Function(ContactData)? onAdminPress;
  final Function(ContactData)? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(contactControllerProvider);
    final contactList = contactState.allContactsResponseModel?.data ?? [];
    final isAdmin = isFromAdmin ?? false;
    if (contactState.isLoading) {
      return _socialSkeleton();
    }

    return SizedBox(
      width: listviewWidth ?? 400.w,
      child: isListview == true
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: contactList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SocialMediaGridDesktopItem(
                  contactData: contactList[index],
                  isAdmin: isAdmin,
                  onAdminPress: (ContactData p1) {
                    if (onAdminPress != null) {
                      onAdminPress?.call(p1);
                    }
                  },
                  onDelete: (ContactData p1) {
                    if (onDelete != null) {
                      onDelete?.call(p1);
                    }
                  },
                );
              },
            )
          : GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount ?? 2,
                crossAxisSpacing: crossAxisSpacing ?? 45.w,
                mainAxisSpacing: mainAxisSpcaing ?? 45.h,
                childAspectRatio: childAspectRatio ?? 1.0,
              ),
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return SocialMediaGridDesktopItem(
                  contactData: contactList[index],
                  isAdmin: isAdmin,
                  onAdminPress: (ContactData p1) {
                    if (onAdminPress != null) {
                      onAdminPress?.call(p1);
                    }
                  },
                  onDelete: (ContactData p1) {
                    if (onDelete != null) {
                      onDelete?.call(p1);
                    }
                  },
                );
              },
            ),
    );
  }

  Widget _socialSkeleton() {
    return SizedBox(
      width: listviewWidth ?? 400.w,
      child: isListview == true
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return _skeletonItem();
              },
            )
          : GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount ?? 2,
                crossAxisSpacing: crossAxisSpacing ?? 45.w,
                mainAxisSpacing: mainAxisSpcaing ?? 45.h,
              ),
              itemBuilder: (context, index) {
                return _skeletonItem();
              },
            ),
    );
  }

  Widget _skeletonItem() {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: Colors.grey.withOpacity(0.15),
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1.w),
        ),
        child: Center(
          child: Container(
            height: 32.w,
            width: 32.w,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(6.w),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaGridDesktopItem extends ConsumerStatefulWidget {
  const SocialMediaGridDesktopItem({
    super.key,
    required this.contactData,
    this.onAdminPress,
    this.isAdmin = false,
    this.onDelete,
  });

  final ContactData contactData;
  final bool? isAdmin;
  final Function(ContactData contactData)? onDelete;
  final Function(ContactData)? onAdminPress;

  @override
  ConsumerState<SocialMediaGridDesktopItem> createState() =>
      _SocialMediaGridDesktopItemState();
}

class _SocialMediaGridDesktopItemState
    extends ConsumerState<SocialMediaGridDesktopItem>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> rotationAnimation;
  bool isHovered = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    rotationAnimation = Tween<double>(begin: -0.02, end: 0.02).animate(
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
    final contactController = ref.read(contactControllerProvider.notifier);
    final contactState = ref.read(contactControllerProvider);

    ref.listen(contactControllerProvider, (previous, next) {
      if (next.lauchUrlError != null) {
        bottomMsg(context, next.lauchUrlError!);
      }
    });

    return Padding(
      padding: EdgeInsets.all(8.w),
      child: MouseRegion(
        onEnter: (event) => onHover(true),
        onExit: (event) => onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..scale(isHovered ? 1.1 : 1.0)
            ..rotateZ(isHovered ? 0.05 : 0.0),
          child: GestureDetector(
            onTap: contactState.isLoading
                ? null
                : () {
                    if (widget.isAdmin == false) {
                      contactController.launchUrl(widget.contactData.url);
                    } else {
                      if (widget.onAdminPress != null) {
                        widget.onAdminPress?.call(widget.contactData);
                      }
                    }
                  },
            onDoubleTap: () {
              if (widget.isAdmin == true) {
                if (widget.onDelete != null) {
                  widget.onDelete?.call(widget.contactData);
                }
              }
            },
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                border: Border.all(
                  color: isHovered
                      ? AppColors.appBlue.withOpacity(0.8)
                      : AppColors.grey.withOpacity(0.3),
                  width: isHovered ? 2.w : 1.w,
                ),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColorDark.withOpacity(0.9),
                    AppColors.lightBlack.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.1, 0.9],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: isHovered ? 15 : 8,
                    spreadRadius: isHovered ? 2 : 1,
                    offset: Offset(0, isHovered ? 6 : 3),
                  ),
                  if (isHovered)
                    BoxShadow(
                      color: AppColors.appBlue.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                ],
              ),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 200),
                scale: isHovered ? 1.15 : 1.0,
                child: CachedNetworkImage(
                  imageUrl: widget.contactData.img,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                  color: isHovered
                      ? Colors.white
                      : Colors.white.withOpacity(0.9),
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
