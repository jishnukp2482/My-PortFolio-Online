import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/contact/contact_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/home/common/shimmer_icon.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/key_features_builder.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class AvailableOn extends ConsumerStatefulWidget {
  const AvailableOn(
      {super.key,
      this.containerSize,
      required this.projectModel,
      this.fetauresItemIconSize,
      this.keyFeaturesSize,
      this.iconSize,
      this.bulletHeight,
      this.bulletSize,
      this.listviewSize});

  final double? containerSize;
  final double? listviewSize;
  final ProjectData projectModel;
  final double? fetauresItemIconSize;
  final double? iconSize;
  final double? keyFeaturesSize;
  final double? bulletHeight;
  final double? bulletSize;

  @override
  ConsumerState<AvailableOn> createState() => _AvailableOnState();
}

class _AvailableOnState extends ConsumerState<AvailableOn> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final contactController = ref.read(contactControllerProvider.notifier);
    final contactSatte = ref.watch(contactControllerProvider);

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: widget.projectModel.publishOn.isNotEmpty
          ? SizedBox(
              height: widget.listviewSize ?? 100.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.projectModel.publishOn.length,
                itemBuilder: (context, index) {
                  final item = widget.projectModel.publishOn[index];
                  final isHovered = hoveredIndex == index;
                  if (item.url.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: contactSatte.isLoading
                            ? null
                            : () {
                                contactController.launchUrl(item.url);
                              },
                        borderRadius: BorderRadius.circular(100),
                        child: MouseRegion(
                          onEnter: (_) {
                            customPrint('hover enter $index');
                            setState(() => hoveredIndex = index);
                          },
                          onExit: (_) {
                            customPrint('hover exit');
                            setState(() => hoveredIndex = null);
                          },
                          child: Container(
                            height: widget.containerSize,
                            width: widget.containerSize,
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).primaryColorDark,
                                    AppColors.lightBlack,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            child: isHovered == true
                                ? ShimmerIcon(
                                    icon: item.platform.toLowerCase() == "ios"
                                        ? Icons.apple
                                        : Icons.android,
                                    iconsize: widget.iconSize ?? 28.sp,
                                  )
                                : Icon(
                                    item.platform.toLowerCase() == "ios"
                                        ? Icons.apple
                                        : Icons.android,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                    size: widget.iconSize ?? 27.sp,
                                  ),
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            )
          : KeyFeaturesItem(
              iconsize: widget.fetauresItemIconSize,
              keyFeaturesSize: widget.keyFeaturesSize,
              bulletSize: widget.bulletSize,
              bulletHeight: widget.bulletHeight,
              keyFeature: KeyFeature(
                  feature: widget.projectModel.defaultPublishOnDescription,
                  id: widget.projectModel.id),
            ),
    );
  }
}
