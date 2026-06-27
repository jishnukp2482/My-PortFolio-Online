import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/about/update_about_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/certificate_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/education_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/experience_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/about/common/skills_listview.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/about/helpers/update_about_helper.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_label_text_field.dart';

class UpdateAbout extends ConsumerStatefulWidget {
  const UpdateAbout({super.key});

  @override
  ConsumerState<UpdateAbout> createState() => _UpdateAboutState();
}

class _UpdateAboutState extends ConsumerState<UpdateAbout> {
  late TextEditingController aboutControllerText;
  @override
  void initState() {
    aboutControllerText = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final aboutController = ref.read(aboutControllerProvider.notifier);
        await aboutController.fetchAbout();
        final state = ref.read(aboutControllerProvider);
        aboutControllerText.text =
            state.updatedAboutResponseModel?.data.aboutDescription ?? "";
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    aboutControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aboutController = ref.read(aboutControllerProvider.notifier);
    final aboutState = ref.watch(aboutControllerProvider);

    ref.listen(
      aboutControllerProvider,
      (previous, next) {
        if (previous?.isLoading == true && next.isLoading == false) {
          if (next.errorMsg != null) {
            bottomMsg(context, next.errorMsg ?? "");
          } else {
            bottomMsg(context, "Update About Successfully");
          }
        }
      },
    );
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Text(
                "About",
                style: GoogleFonts.inter(
                  color: AppColors.appBlue,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2.w,
                  fontSize: 26.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: LabelCustomTextField(
                  controller: aboutControllerText,
                  hintText: "About Description",
                  textFieldLabel: "",
                  lines: 5,
                  onchanged: (value) {
                    aboutController.updateAboutDescription(value);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Professional Experience",
                    style: GoogleFonts.inter(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2.w,
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        professionalExperienceAlert(
                          context: context,
                          onConfirm: (model) {
                            aboutController.updateProfessionalExperience(model);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.appBlue,
                      ))
                ],
              ),
              ExperienceMenu(
                isFromAdmin: true,
                onDelete: (p0) {
                  deleteItemInAbout(
                    context: context,
                    title: "Experience",
                    deletingItemTtitle: "${p0.role},${p0.companyName}",
                    onConfirm: () {
                      aboutController.deleteProfessionalExperience(p0.id);
                    },
                  );
                },
                onAdminPress: (p0) {
                  professionalExperienceAlert(
                    model: p0,
                    context: context,
                    onConfirm: (model) {
                      aboutController.updateProfessionalExperience(model);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Certifications",
                    style: GoogleFonts.inter(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2.w,
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        certificationsAlert(
                          context: context,
                          onConfirm: (model) {
                            aboutController.updateCertifications(model);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.appBlue,
                      ))
                ],
              ),
              CertificateDespTopMenu(
                isFromAdmin: true,
                onDelete: (p0) {
                  deleteItemInAbout(
                    context: context,
                    title: "Certification",
                    deletingItemTtitle: "${p0.title},${p0.year}",
                    onConfirm: () {
                      aboutController.deleteCertifications(p0.id);
                    },
                  );
                },
                onAdminPress: (p0) {
                  certificationsAlert(
                    model: p0,
                    context: context,
                    onConfirm: (model) {
                      aboutController.updateCertifications(model);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Educations",
                    style: GoogleFonts.inter(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2.w,
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        educationAlert(
                          context: context,
                          onConfirm: (model) {
                            aboutController.updateEducation(model);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.appBlue,
                      ))
                ],
              ),
              EducationMenu(
                isFromAdmin: true,
                onDelete: (p0) {
                  deleteItemInAbout(
                    context: context,
                    title: "Education",
                    deletingItemTtitle: "${p0.title},${p0.year}",
                    onConfirm: () {
                      aboutController.deleteEducation(p0.id);
                    },
                  );
                },
                onAdminPress: (p0) {
                  educationAlert(
                    model: p0,
                    context: context,
                    onConfirm: (model) {
                      aboutController.updateEducation(model);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Technical Skills",
                    style: GoogleFonts.inter(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2.w,
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        skillAlert(
                          context: context,
                          onConfirm: (model) {
                            aboutController.updateSkill(model, true);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.appBlue,
                      ))
                ],
              ),
              TechnicalSkillsMenu(
                isFromAdmin: true,
                onDelete: (p0) {
                  deleteItemInAbout(
                    context: context,
                    title: "Technical Skill",
                    deletingItemTtitle: p0,
                    onConfirm: () {
                      aboutController.deleteSkills(p0, true);
                    },
                  );
                },
                onAdminPress: (p0) {
                  skillAlert(
                    model: p0,
                    context: context,
                    onConfirm: (model) {
                      aboutController.updateSkill(model, true);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Soft Skills",
                    style: GoogleFonts.inter(
                      color: AppColors.appBlue,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2.w,
                      fontSize: 26.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        skillAlert(
                          context: context,
                          onConfirm: (model) {
                            aboutController.updateSkill(model, false);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: AppColors.appBlue,
                      ))
                ],
              ),
              SoftSkillsMenu(
                isFromAdmin: true,
                onDelete: (p0) {
                  deleteItemInAbout(
                    context: context,
                    title: "Soft Skill",
                    deletingItemTtitle: p0,
                    onConfirm: () {
                      aboutController.deleteSkills(p0, false);
                    },
                  );
                },
                onAdminPress: (p0) {
                  skillAlert(
                    model: p0,
                    context: context,
                    onConfirm: (model) {
                      aboutController.updateSkill(model, false);
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appBlue,
        child: aboutState.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              )
            : Icon(
                Icons.upload_outlined,
                color: AppColors.black,
              ),
        onPressed: () {
          final current = aboutState.updatedAboutResponseModel;
          if (current == null) return;
          final data = current.data;

          aboutController.updateAbout(toRequest(data));
        },
      ),
    ));
  }

  UpdateAboutRequestModel toRequest(AboutData data) {
    return UpdateAboutRequestModel(
        aboutDescription: data.aboutDescription,
        professionalExperience: data.professionalExperience
            .map(
              (e) => ProfessionalExperienceRequest(
                  role: e.role,
                  companyName: e.companyName,
                  duration: e.duration,
                  description: e.description),
            )
            .toList(),
        certifications: data.certifications
            .map(
              (e) => CertificationRequest(title: e.title, year: e.year),
            )
            .toList(),
        educations: data.educations
            .map(
              (e) => EducationRequest(
                  title: e.title, institute: e.institute, year: e.year),
            )
            .toList(),
        technicalSkills: data.technicalSkills,
        softSkills: data.softSkills);
  }
}
