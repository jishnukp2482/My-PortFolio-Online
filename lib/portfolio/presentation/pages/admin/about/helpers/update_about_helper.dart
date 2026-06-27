import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_label_text_field.dart';
import 'package:uuid/uuid.dart';

void professionalExperienceAlert({
  required BuildContext context,
  required void Function(ProfessionalExperience model) onConfirm,
  ProfessionalExperience? model,
}) {
  final roleController = TextEditingController(text: model?.role ?? "");
  final companyController =
      TextEditingController(text: model?.companyName ?? "");
  final experienceController =
      TextEditingController(text: model?.duration ?? "");
  final descriptionController =
      TextEditingController(text: model?.description ?? "");

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.transparent,
        content: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColorDark,
              AppColors.lightBlack,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model == null ? "Add Experience" : "Edit Experience",
                  style: GoogleFonts.inter(
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2.w,
                    fontSize: 26.sp,
                  ),
                ),
                LabelCustomTextField(
                  hintText: "Role",
                  textFieldLabel: "Role",
                  controller: roleController,
                  textFieldLabelColor: AppColors.white,
                ),
                LabelCustomTextField(
                  hintText: "Company",
                  textFieldLabel: "Company",
                  controller: companyController,
                  textFieldLabelColor: AppColors.white,
                ),
                LabelCustomTextField(
                  hintText: "Experience",
                  textFieldLabel: "Experience",
                  controller: experienceController,
                  textFieldLabelColor: AppColors.white,
                ),
                LabelCustomTextField(
                  hintText: "Description",
                  textFieldLabel: "Description",
                  controller: descriptionController,
                  textFieldLabelColor: AppColors.white,
                  lines: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10.w,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: ElevatedButton(
                        onPressed: () {
                          String id = Uuid().v4();
                          final newModel = ProfessionalExperience(
                            id: model?.id ?? id,
                            role: roleController.text.trim(),
                            companyName: companyController.text.trim(),
                            duration: experienceController.text.trim(),
                            description: descriptionController.text.trim(),
                          );

                          Navigator.pop(context);
                          onConfirm(newModel);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appBlue),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void certificationsAlert({
  required BuildContext context,
  required void Function(Certification model) onConfirm,
  Certification? model,
}) {
  final titleController = TextEditingController(text: model?.title ?? "");
  final yearController = TextEditingController(text: model?.year ?? "");

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.transparent,
        content: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColorDark,
              AppColors.lightBlack,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model == null ? "Add Certification" : "Edit Certification",
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
                  hintText: "Year",
                  textFieldLabel: "Yer",
                  controller: yearController,
                  textFieldLabelColor: AppColors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10.w,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: ElevatedButton(
                        onPressed: () {
                          String id = Uuid().v4();
                          final newModel = Certification(
                            id: model?.id ?? id,
                            title: titleController.text.trim(),
                            year: yearController.text.trim(),
                          );

                          Navigator.pop(context);
                          onConfirm(newModel);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appBlue),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void educationAlert({
  required BuildContext context,
  required void Function(Education model) onConfirm,
  Education? model,
}) {
  final titleController = TextEditingController(text: model?.title ?? "");
  final yearController = TextEditingController(text: model?.year ?? "");
  final instituteController =
      TextEditingController(text: model?.institute ?? "");

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.transparent,
        content: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColorDark,
              AppColors.lightBlack,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model == null ? "Add Education" : "Edit Education",
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
                  hintText: "Year",
                  textFieldLabel: "Yer",
                  controller: yearController,
                  textFieldLabelColor: AppColors.white,
                ),
                LabelCustomTextField(
                  hintText: "Institution",
                  textFieldLabel: "Institution",
                  controller: instituteController,
                  textFieldLabelColor: AppColors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10.w,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: ElevatedButton(
                        onPressed: () {
                          String id = Uuid().v4();
                          final newModel = Education(
                            id: model?.id ?? id,
                            title: titleController.text.trim(),
                            year: yearController.text.trim(),
                            institute: instituteController.text.trim(),
                          );

                          Navigator.pop(context);
                          onConfirm(newModel);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appBlue),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void skillAlert({
  required BuildContext context,
  required void Function(String model) onConfirm,
  String? model,
}) {
  final skillController = TextEditingController(text: model ?? "");

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.transparent,
        content: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColorDark,
              AppColors.lightBlack,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model == null ? "Add Skill" : "Edit Skill",
                  style: GoogleFonts.inter(
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2.w,
                    fontSize: 26.sp,
                  ),
                ),
                LabelCustomTextField(
                  hintText: "Skill",
                  textFieldLabel: "Skill",
                  controller: skillController,
                  textFieldLabelColor: AppColors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10.w,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: ElevatedButton(
                        onPressed: () {
                         
                          final newModel = skillController.text.trim();

                          Navigator.pop(context);
                          onConfirm(newModel);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appBlue),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

void deleteItemInAbout({
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
              SizedBox(
                height: 40.h,
              ),
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
              )
            ],
          ),
        ),
      );
    },
  );
}
