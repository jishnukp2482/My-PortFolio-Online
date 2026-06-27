import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_reorderable_grid_view/widgets/custom_draggable.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/project/project_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/project/helper/update_project_helper.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';

class ProjectImageManager extends StatefulWidget {
  final List<ProjectImageItem> images;
  final ProjectController projectController;
  final ProjectData? model;
  final void Function(void Function()) setState;

  const ProjectImageManager({
    super.key,
    required this.images,
    required this.projectController,
    required this.setState,
    this.model,
  });

  @override
  State<ProjectImageManager> createState() =>
      _ProjectImageManagerState();
}

class _ProjectImageManagerState
    extends State<ProjectImageManager> {
  late List<ProjectImageItem> images;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    images = [...widget.images];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20.w),

      child: Container(
        width: w,
        height: h * 0.92,

        padding: EdgeInsets.all(20.w),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColorDark, AppColors.lightBlack],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          children: [
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Manage Project Images",
                      style: GoogleFonts.inter(
                        color: AppColors.appBlue,
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      "Drag images to reorder",
                      style: GoogleFonts.inter(
                        color: Colors.white60,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    /// ADD IMAGE
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appBlue,
                      ),

                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.image,
                          withData: true,
                        );

                        if (result != null) {
                          setState(() {
                            for (var file in result.files) {
                              images.add(
                                ProjectImageItem(
                                  memoryImage: file.bytes!,
                                  fileBytes: file.bytes!,
                                  fileName: file.name,
                                ),
                              );
                            }
                          });
                        }
                      },

                      icon: Icon(Icons.add, color: Colors.black),

                      label: Text(
                        "Add Images",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    SizedBox(width: 15.w),

                    /// CLOSE
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: Icon(Icons.close, color: Colors.white, size: 28.sp),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// EMPTY
            if (images.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported,
                        color: Colors.white30,
                        size: 70.sp,
                      ),

                      SizedBox(height: 15.h),

                      Text(
                        "No Images Added",
                        style: GoogleFonts.inter(
                          color: Colors.white54,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            /// GRID
            if (images.isNotEmpty)
              Expanded(
                child: ReorderableBuilder(
                  scrollController: scrollController,

                  enableDraggable: true,

                  longPressDelay: const Duration(milliseconds: 100),

                  onReorder: (ReorderedListFunction reorderedListFunction) {
                    setState(() {
                      final reordered = reorderedListFunction(
                        images,
                      ).cast<ProjectImageItem>();

                      images
                        ..clear()
                        ..addAll(reordered);
                    });
                  },

                  children: images.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    return CustomDraggable(
                      key: ValueKey(
                        "${item.publicId ?? item.networkImage ?? item.memoryImage.hashCode}",
                      ),

                      data: item,

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),

                          border: Border.all(color: Colors.white10),
                        ),

                        child: Stack(
                          children: [
                            /// IMAGE
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.w),

                                child: item.networkImage != null
                                    ? CachedNetworkImage(
                                        imageUrl: item.networkImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.memory(
                                        item.memoryImage!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),

                            /// OVERLAY
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),

                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.15),
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.5),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            /// DRAG ICON
                            Positioned(
                              top: 10,
                              left: 10,

                              child: Container(
                                padding: EdgeInsets.all(8.w),

                                decoration: BoxDecoration(
                                  color: Colors.black54,

                                  borderRadius: BorderRadius.circular(10.w),
                                ),

                                child: Icon(
                                  Icons.drag_indicator,
                                  color: Colors.white,
                                  size: 22.sp,
                                ),
                              ),
                            ),

                            /// DELETE
                            Positioned(
                              top: 10,
                              right: 10,

                              child: GestureDetector(
                                onTap: () async {
                                  try {
                                    if (item.publicId != null &&
                                        widget.model?.id != null) {
                                      await widget.projectController
                                          .deleteProjectImg(
                                            widget.model!.id,
                                            item.publicId!,
                                          );

                                      setState(() {
                                        images.removeWhere(
                                          (e) => e.publicId == item.publicId,
                                        );
                                      });
                                    } else {
                                      setState(() {
                                        images.removeAt(index);
                                      });
                                    }
                                  } catch (e) {
                                    bottomMsg(
                                      context,
                                      "Failed to Delete Image",
                                    );
                                  }
                                },

                                child: Container(
                                  padding: EdgeInsets.all(8.w),

                                  decoration: BoxDecoration(
                                    color: Colors.black54,

                                    borderRadius: BorderRadius.circular(10.w),
                                  ),

                                  child: Icon(
                                    Icons.delete_outline,

                                    color: Colors.red,

                                    size: 22.sp,
                                  ),
                                ),
                              ),
                            ),

                            /// THUMBNAIL
                            if (index == 0)
                              Positioned(
                                bottom: 12,
                                left: 12,

                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 6.h,
                                  ),

                                  decoration: BoxDecoration(
                                    color: AppColors.appBlue,

                                    borderRadius: BorderRadius.circular(8.w),
                                  ),

                                  child: Text(
                                    "Thumbnail",

                                    style: GoogleFonts.inter(
                                      color: Colors.white,

                                      fontWeight: FontWeight.w600,

                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ),

                            /// ORDER
                            Positioned(
                              bottom: 12,
                              right: 12,

                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.black54,

                                  borderRadius: BorderRadius.circular(8.w),
                                ),

                                child: Text(
                                  "#${index + 1}",

                                  style: GoogleFonts.inter(
                                    color: Colors.white,

                                    fontWeight: FontWeight.w600,

                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),

                  builder: (children) {
                    return GridView(
                      controller: scrollController,

                      padding: EdgeInsets.only(bottom: 20.h),

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 18.w,
                        mainAxisSpacing: 18.h,
                        childAspectRatio: 1,
                      ),

                      children: children,
                    );
                  },
                ),
              ),

            SizedBox(height: 20.h),

            /// SAVE BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appBlue,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 16.h,
                    ),
                  ),

                  onPressed: () {
                    widget.images
                      ..clear()
                      ..addAll(images);

                    widget.setState(() {});

                    Navigator.pop(context);
                  },

                  child: Text(
                    "Done",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
