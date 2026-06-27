import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/empty_state.dart';

class CarouselImg extends StatefulWidget {
  const CarouselImg(
      {super.key,
      required this.imgs,
      this.height,
      this.viewportFraction,
      this.autoPlay = true,
      this.showIndicators = true,
      this.borderRadius = 20,
      this.dotindicatorheight = 8,
      this.dotindicatorwidth = 8,
      this.imagePadding});

  final List<ProjectImage> imgs;
  final double? height;
  final double? viewportFraction;
  final bool autoPlay;
  final bool showIndicators;
  final double borderRadius;
  final double dotindicatorheight;
  final double dotindicatorwidth;
  final double? imagePadding;

  @override
  State<CarouselImg> createState() => _CarouselImgState();
}

class _CarouselImgState extends State<CarouselImg> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.imgs.isEmpty) {
      return EmptyState(message: "No images available for this project.");
    }
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: widget.imgs.map((e) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius.r),
                child: Stack(
                  children: [
                    // Main image with proper loading handling
                    _buildImageWidget(e, imagePadding: widget.imagePadding),

                    // Gradient overlay at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius.r),
                            bottomRight: Radius.circular(widget.borderRadius.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: widget.height ?? 650.h,
            autoPlay: widget.imgs.length == 1 ? false : widget.autoPlay,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            enableInfiniteScroll: widget.imgs.length == 1 ? false : true,
            viewportFraction: widget.viewportFraction ?? 0.85,
            pauseAutoPlayOnTouch: true,
            pauseAutoPlayOnManualNavigate: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        if (widget.showIndicators && widget.imgs.length > 1) ...[
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgs.asMap().entries.map((entry) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: widget.dotindicatorwidth.w,
                    height: widget.dotindicatorheight.w,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .primaryColor
                          .withOpacity(_currentIndex == entry.key ? 1 : 0.4),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  // Helper method to build image with loading state
  Widget _buildImageWidget(ProjectImage img, {double? imagePadding}) {
    return Padding(
      padding: EdgeInsets.all(imagePadding ?? 0),
      child: CachedNetworkImage(
        imageUrl: img.imgUrl,
        fit: BoxFit.contain,
        width: double.infinity,
        fadeInDuration: const Duration(milliseconds: 500),
        placeholder: (context, url) => Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: 30.w,
            width: 30.w,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.appBlue,
            ),
          ),
        ),
        errorWidget: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: Icon(
              Icons.error_outline,
              size: 40.w,
              color: Colors.grey[400],
            ),
          );
        },
      ),
    );
  }
}
