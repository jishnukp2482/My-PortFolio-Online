import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/custom_draggable.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/project/create_project_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/project/project_controller.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/project/project_state.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/project/helper/project_image_manager.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_label_text_field.dart';

void projectAlert({
  required BuildContext context,
  required void Function(CreateProjectRequestModel model) onConfirm,
  required ProjectController projectController,
  required ProjectState projectState,

  ProjectData? model,
}) {
  alertPrint("model Project data = $model");
  final titleController = TextEditingController(text: model?.projectName ?? "");
  final subTitleController = TextEditingController(
    text: model?.subDescription ?? "",
  );
  final descriptionController = TextEditingController(
    text: model?.projectDescription ?? "",
  );
  final defaultPublishController = TextEditingController(
    text: model?.defaultPublishOnDescription ?? "",
  );
  final orderController = TextEditingController(
    text: model?.order.toString() ?? "",
  );

  /// 🔹 EXISTING DATA → EDIT MODE
  List<ProjectImageItem> projectImages = [
    ...model?.imgUrls.map(
          (e) => ProjectImageItem(networkImage: e.imgUrl, publicId: e.publicId),
        ) ??
        [],
  ];

  final List<CreateKeyFeatures> createKeyFeatures =
      model?.keyFeatures.map((e) => CreateKeyFeatures(e.feature)).toList() ??
      [];

  final List<CreateProjectTechonlogies> createTechnologies =
      model?.technologies
          .map((e) => CreateProjectTechonlogies(e.technologies, e.description))
          .toList() ??
      [];

  final List<CreatePublishOn> createPublishOn =
      model?.publishOn
          .map((e) => CreatePublishOn(e.platform, e.url))
          .toList() ??
      [];
  bool isShow = model?.show ?? true;
  bool? isOrderAvailable = model != null ? true : null;
  bool isCheckingOrder = false;
  showDialog(
    context: context,
    builder: (context) {
      final h = MediaQuery.of(context).size.height;
      final w = MediaQuery.of(context).size.width;

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.transparent,
            content: SizedBox(
              width: w * 0.9.w,
              height: h * 0.9.h,
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColorDark,
                      AppColors.lightBlack,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 12.h,
                    children: [
                      /// 🔹 TITLE
                      Text(
                        model == null ? "Add Project" : "Edit Project",
                        style: GoogleFonts.inter(
                          color: AppColors.appBlue,
                          fontWeight: FontWeight.w800,
                          fontSize: 24.sp,
                        ),
                      ),

                      /// 🔹 PROJECT NAME
                      LabelCustomTextField(
                        hintText: "Project Name",
                        textFieldLabel: "Project Name",
                        controller: titleController,
                        textFieldLabelColor: AppColors.white,
                      ),
                      showStatusWidget(
                        isShow: isShow,
                        onChanged: (value) {
                          setState(() {
                            isShow = value;
                          });
                        },
                      ),

                      LabelCustomTextField(
                        hintText: "Order",
                        textFieldLabel: "Order",
                        controller: orderController,
                        textFieldLabelColor: AppColors.white,

                        onchanged: (value) async {
                          if (value.trim().isEmpty) {
                            setState(() {
                              isOrderAvailable = null;
                            });
                            return;
                          }

                          final orderID = int.tryParse(value);

                          if (orderID == null) {
                            setState(() {
                              isOrderAvailable = false;
                            });
                            return;
                          }

                          setState(() {
                            isCheckingOrder = true;
                          });

                          final response = await projectController
                              .checkOrderIDAvailability(
                                orderID,
                                model?.id ?? "",
                              );

                          setState(() {
                            isCheckingOrder = false;
                            isOrderAvailable = response?.available;
                          });
                        },
                        showSuffixicon: true,
                        suffix: isCheckingOrder
                            ? Padding(
                                padding: EdgeInsets.all(10.w),
                                child: SizedBox(
                                  width: 18.w,
                                  height: 18.h,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5,
                                    color: AppColors.appBlue,
                                  ),
                                ),
                              )
                            : isOrderAvailable == null
                            ? const SizedBox.shrink()
                            : Icon(
                                isOrderAvailable!
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: isOrderAvailable!
                                    ? Colors.green
                                    : Colors.red,
                                size: 30,
                              ),
                      ),

                      /// 🔹 SUB DESC
                      LabelCustomTextField(
                        hintText: "Sub Description",
                        textFieldLabel: "Sub Description",
                        controller: subTitleController,
                        textFieldLabelColor: AppColors.white,
                      ),

                      /// 🔹 DESCRIPTION
                      LabelCustomTextField(
                        hintText: "Project Description",
                        textFieldLabel: "Project Description",
                        controller: descriptionController,
                        lines: 4,
                        textFieldLabelColor: AppColors.white,
                      ),
                      SizedBox(height: 20.h),

                      /// 🔹 PUBLISH List
                      publishOnWidget(
                        publishList: createPublishOn,
                        setState: setState,
                      ),
                      SizedBox(height: 20.h),

                      /// 🔹 DEFAULT PUBLISH
                      LabelCustomTextField(
                        hintText: "Default Publish Description",
                        textFieldLabel: "Default Publish Description",
                        controller: defaultPublishController,
                        textFieldLabelColor: AppColors.white,
                      ),

                      SizedBox(height: 20.h),
                      technologiesWidget(
                        technologiesList: createTechnologies,
                        setState: setState,
                      ),
                      SizedBox(height: 20.h),
                      keyFeaturesWidget(
                        keyFeaturesList: createKeyFeatures,
                        setState: setState,
                      ),
                      SizedBox(height: 20.h),

                      /// 🔥 IMAGE SECTION (CONTACT STYLE MULTI)
                      projectImagesWidget(
                        images: projectImages,
                        setState: setState,
                        projectController: projectController,
                        context: context,

                        model: model,
                      ),

                      /// 🔹 ACTIONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          SizedBox(width: 10.w),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appBlue,
                            ),
                            onPressed: () {
                              if (titleController.text.isEmpty) {
                                bottomMsg(
                                  context,
                                  "Please enter a valid title",
                                );
                                return;
                              }
                              if (subTitleController.text.isEmpty) {
                                bottomMsg(
                                  context,
                                  "Please enter a valid subtitile",
                                );
                                return;
                              }
                              if (descriptionController.text.isEmpty) {
                                bottomMsg(
                                  context,
                                  "Please enter a valid description",
                                );
                                return;
                              }
                              if (defaultPublishController.text.isEmpty) {
                                bottomMsg(
                                  context,
                                  "Please enter a valid default publish content",
                                );
                                return;
                              }
                              if (orderController.text.isEmpty) {
                                bottomMsg(
                                  context,
                                  "Please enter a valid order id",
                                );
                                return;
                              }

                              if (isOrderAvailable != true) {
                                bottomMsg(
                                  context,
                                  "Please enter an available order ID",
                                );
                                return;
                              }

                              final request = CreateProjectRequestModel(
                                id: model?.id ?? "",
                                projectName: titleController.text.trim(),
                                subDescription: subTitleController.text.trim(),
                                projectDescription: descriptionController.text
                                    .trim(),
                                images: projectImages
                                    .where((e) => e.fileBytes != null)
                                    .map(
                                      (e) => MultipartFile.fromBytes(
                                        e.fileBytes!,
                                        filename: e.fileName,
                                        contentType: MediaType("image", "webp"),
                                      ),
                                    )
                                    .toList(),
                                defaultPublishOnDescription:
                                    defaultPublishController.text.trim(),
                                keyFeatures: createKeyFeatures,
                                publishOn: createPublishOn,
                                show: isShow,
                                order:
                                    int.tryParse(orderController.text.trim()) ??
                                    0,
                                technologies: createTechnologies,
                              );

                              onConfirm(request);
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget showStatusWidget({
  required bool isShow,
  required Function(bool value) onChanged,
}) {
  return Container(
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.white24),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project Visibility",
                style: GoogleFonts.inter(
                  color: AppColors.appBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                isShow
                    ? "Project visible in portfolio"
                    : "Project hidden from portfolio",
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),

        Switch(
          value: isShow,
          activeThumbColor: AppColors.appBlue,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}

Widget keyFeaturesWidget({
  required List<CreateKeyFeatures> keyFeaturesList,
  required void Function(void Function()) setState,
}) {
  return Container(
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.white24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Key Features",
              style: GoogleFonts.inter(
                color: AppColors.appBlue,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  keyFeaturesList.add(CreateKeyFeatures(""));
                });
              },
              icon: Icon(Icons.add, color: AppColors.appBlue),
            ),
          ],
        ),

        SizedBox(height: 10.h),

        ...keyFeaturesList.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          final featureController = TextEditingController(text: item.feature);

          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: Colors.white.withOpacity(0.03),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: LabelCustomTextField(
                      hintText: "Enter Feature",
                      textFieldLabel: "Feature",
                      controller: featureController,
                      textFieldLabelColor: AppColors.white,
                      onchanged: (value) {
                        keyFeaturesList[index] = CreateKeyFeatures(value);
                      },
                    ),
                  ),

                  SizedBox(width: 10.w),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        keyFeaturesList.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete, color: AppColors.red),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    ),
  );
}

///roject image item
class ProjectImageItem {
  final String? networkImage;
  final Uint8List? memoryImage;
  final Uint8List? fileBytes;
  final String? fileName;
  final String? publicId;

  ProjectImageItem({
    this.networkImage,
    this.memoryImage,
    this.fileBytes,
    this.fileName,
    this.publicId,
  });
}

Widget projectImagesWidget({
  required List<ProjectImageItem> images,
  required void Function(void Function()) setState,
  required ProjectController projectController,
  required BuildContext context,
  ProjectData? model,
}) {
  final scrollController = ScrollController();

  return Container(
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.white24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        Row(
          children: [
            Text(
              "Project Images",
              style: GoogleFonts.inter(
                color: AppColors.appBlue,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                await showDialog(
                  context: context,
                  barrierColor: Colors.black87,
                  builder: (_) {
                    return ProjectImageManager(
                      images: images,
                      setState: setState,
                      projectController: projectController,
                      model: model,
                    );
                  },
                );
              },
              icon: Icon(Icons.open_in_full, color: AppColors.appBlue),
              label: Text(
                "Manage Images",
                style: TextStyle(color: AppColors.appBlue),
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h),

        /// ADD BUTTON
        GestureDetector(
          onTap: () async {
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
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 18.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(color: Colors.white24),
              color: Colors.white.withOpacity(0.02),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  color: AppColors.appBlue,
                  size: 30.sp,
                ),

                SizedBox(height: 8.h),

                Text(
                  "Add Project Images",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  "Drag and reorder images below",
                  style: GoogleFonts.inter(
                    color: Colors.white54,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 25.h),

        /// EMPTY
        if (images.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.white30,
                  size: 45.sp,
                ),

                SizedBox(height: 12.h),

                Text(
                  "No Images Added",
                  style: GoogleFonts.inter(
                    color: Colors.white54,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),

        /// GRID
        if (images.isNotEmpty)
          SizedBox(
            height: 500.h,
            child: ReorderableBuilder(
              scrollController: scrollController,
              enableDraggable: true,
              longPressDelay: const Duration(milliseconds: 150),
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
                  child: Container(
                    key: ValueKey(
                      "${item.publicId ?? item.networkImage ?? item.memoryImage.hashCode}",
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      border: Border.all(color: Colors.white10),
                      color: Colors.white.withOpacity(0.02),
                    ),

                    child: Stack(
                      children: [
                        /// IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14.w),
                          child: item.networkImage != null
                              ? CachedNetworkImage(
                                  imageUrl: item.networkImage!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  item.memoryImage!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                        ),

                        /// DARK OVERLAY
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.w),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.15),
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.4),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// DELETE
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () async {
                              try {
                                if (item.publicId != null &&
                                    model?.id != null) {
                                  await projectController.deleteProjectImg(
                                    model!.id,
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
                                bottomMsg(context, "Failed to Delete Image");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(7.w),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),

                        /// THUMBNAIL
                        if (index == 0)
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.appBlue,
                                borderRadius: BorderRadius.circular(8.w),
                              ),
                              child: Text(
                                "Thumbnail",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                        /// ORDER NUMBER
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Text(
                              "#${index + 1}",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
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

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.9,
                  ),

                  children: children,
                );
              },
            ),
          ),
      ],
    ),
  );
}

Widget publishOnWidget({
  required List<CreatePublishOn> publishList,
  required void Function(void Function()) setState,
}) {
  return Container(
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.white24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Publish On",
              style: GoogleFonts.inter(
                color: AppColors.appBlue,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  publishList.add(CreatePublishOn("", ""));
                });
              },
              icon: Icon(Icons.add, color: AppColors.appBlue),
            ),
          ],
        ),

        SizedBox(height: 10.h),

        ...publishList.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          final platformController = TextEditingController(text: item.platform);

          final urlController = TextEditingController(text: item.url);

          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: Colors.white.withOpacity(0.03),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: LabelCustomTextField(
                          hintText: "Platform",
                          textFieldLabel: "Platform",
                          controller: platformController,
                          textFieldLabelColor: AppColors.white,
                          onchanged: (value) {
                            publishList[index] = CreatePublishOn(
                              value,
                              publishList[index].url,
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 10.w),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            publishList.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete, color: AppColors.red),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: LabelCustomTextField(
                      hintText: "URL",
                      textFieldLabel: "URL",
                      controller: urlController,
                      textFieldLabelColor: AppColors.white,
                      onchanged: (value) {
                        publishList[index] = CreatePublishOn(
                          publishList[index].platform,
                          value,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    ),
  );
}

Widget technologiesWidget({
  required List<CreateProjectTechonlogies> technologiesList,
  required void Function(void Function()) setState,
}) {
  /// ENSURE ONLY 2 ITEMS EXIST
  if (technologiesList.isEmpty) {
    technologiesList.addAll([
      CreateProjectTechonlogies("FRONTEND", ""),
      CreateProjectTechonlogies("BACKEND", ""),
    ]);
  }

  return Container(
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.white24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Technologies",
          style: GoogleFonts.inter(
            color: AppColors.appBlue,
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
        ),

        SizedBox(height: 20.h),

        ...technologiesList.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          final descriptionController = TextEditingController(
            text: item.description,
          );

          final isFrontend = item.technologies.toUpperCase() == "FRONTEND";

          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                color: Colors.white.withOpacity(0.03),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(color: Colors.white24),
                      color: Colors.white.withOpacity(0.03),
                    ),
                    child: Text(
                      isFrontend ? "Frontend" : "Backend",
                      style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  /// DESCRIPTION
                  LabelCustomTextField(
                    hintText: isFrontend
                        ? "Enter frontend technologies..."
                        : "Enter backend technologies...",
                    textFieldLabel: "Description",
                    controller: descriptionController,
                    lines: 4,
                    textFieldLabelColor: AppColors.white,
                    onchanged: (value) {
                      technologiesList[index] = CreateProjectTechonlogies(
                        item.technologies,
                        value,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    ),
  );
}

void deleteItemProject({
  required BuildContext context,
  required VoidCallback onConfirm,
  required String title,
  required String deletingItemTtitle,
}) {
  showDialog(
    context: context,
    builder: (context) {
      final w = MediaQuery.of(context).size.width;
      return AlertDialog(
        backgroundColor: AppColors.transparent,
        content: Container(
          width: w * 0.4,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 10.h,
            children: [
              Text(
                "Delete $title",
                style: GoogleFonts.inter(
                  color: AppColors.appBlue,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2.w,
                  fontSize: 22.sp,
                ),
              ),
              Text(
                "Are you sure you want to delete\n\n$deletingItemTtitle ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14.sp,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                      ),
                      onPressed: () {
                        onConfirm();
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
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
