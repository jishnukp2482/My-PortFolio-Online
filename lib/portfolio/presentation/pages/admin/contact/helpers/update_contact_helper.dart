import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/contacts/create_contact_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/fetch_contacts_response_model.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_label_text_field.dart';

void contactAlert({
  required BuildContext context,
  required void Function(CreateContactRequestModel model) onConfirm,
  ContactData? model,
}) {
  final titleController = TextEditingController(text: model?.title ?? "");
  final img = model?.img ?? "";
  final urlController = TextEditingController(text: model?.url ?? "");
  final orderController = TextEditingController(
    text: model?.order.toString() ?? "",
  );
  MultipartFile? selectedImage;
  Uint8List? previewBytes;
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.transparent,
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
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.h,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      model == null ? "Add Contact" : "Edit Contact",
                      style: GoogleFonts.inter(
                        color: AppColors.appBlue,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2.w,
                        fontSize: 26.sp,
                      ),
                    ),
                    LabelCustomTextField(
                      hintText: "Title",
                      textFieldLabel: "Title",
                      controller: titleController,
                      textFieldLabelColor: AppColors.white,
                    ),
                    LabelCustomTextField(
                      hintText: "Url",
                      textFieldLabel: "Url",
                      controller: urlController,
                      textFieldLabelColor: AppColors.white,
                    ),
                    LabelCustomTextField(
                      hintText: "Order",
                      textFieldLabel: "Order",
                      controller: orderController,
                      textFieldLabelColor: AppColors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: SizedBox(
                        height: 150.h,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            /// 🔹 IMAGE OR EMPTY BACKGROUND
                            Positioned.fill(
                              // 🔥 IMPORTANT
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.w),
                                child: previewBytes != null
                                    ? Image.memory(
                                        previewBytes!,
                                        fit: BoxFit.contain,
                                      )
                                    : img.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: img,
                                        fit: BoxFit.contain,

                                        placeholder: (context, url) =>
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.w),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Theme.of(
                                                      context,
                                                    ).primaryColorDark,
                                                    AppColors.lightBlack,
                                                    AppColors.lightBlack,
                                                    AppColors.lightBlack,
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Theme.of(
                                                context,
                                              ).primaryColorDark,
                                              AppColors.lightBlack,
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.upload_file,
                                                color: AppColors.appBlue,
                                                size: 40.sp,
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                "Upload Image",
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ),

                            /// 🔥 EDIT / UPLOAD BUTTON (ALWAYS VISIBLE)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () async {
                                  final result = await FilePicker.platform
                                      .pickFiles(
                                        type: FileType.image,
                                        withData: true,
                                      );

                                  if (result != null) {
                                    final file = result.files.first;

                                    setState(() {
                                      previewBytes = file.bytes;

                                      selectedImage = MultipartFile.fromBytes(
                                        file.bytes!,
                                        filename: file.name,
                                        contentType: MediaType('image', 'webp'),
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    img.isNotEmpty || previewBytes != null
                                        ? Icons.edit
                                        : Icons.upload, // 🔥 dynamic icon
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10.w,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: ElevatedButton(
                            onPressed: () {
                              final CreateContactRequestModel newModel;
                              if (model == null) {
                                newModel = CreateContactRequestModel(
                                  title: titleController.text.trim(),
                                  url: urlController.text.trim(),
                                  order: orderController.text.trim(),
                                  img: selectedImage,
                                );
                              } else {
                                newModel = CreateContactRequestModel(
                                  title: titleController.text.trim(),
                                  url: urlController.text.trim(),
                                  id: model.id.toString(),
                                  img: selectedImage,
                                  order: orderController.text.trim(),
                                );
                              }

                              Navigator.pop(context);
                              onConfirm(newModel);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appBlue,
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

void deleteItemContact({
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
                        Navigator.pop(context);
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
