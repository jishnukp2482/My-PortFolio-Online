import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/about/update_about_request_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/domain/usecase/about/download_resume_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/about/fetch_about_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/about/update_about_usecase.dart';
import 'package:potfolio/portfolio/domain/usecase/about/upload_resume_usecase.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_state.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_helper.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_controller.g.dart';

@riverpod
class AboutController extends _$AboutController {
  @override
  AboutState build() {
    Future.microtask(fetchAbout);
    return AboutState.initial();
  }

  Future<void> downloadResume(bool isAdmin) async {
    state = state.copyWith(isLoading: true, errorMsg: null);
    try {
      final downloadResumeUseCase = ref.read(getDownloadUsecaseProvider);
      var result = await downloadResumeUseCase.build();
      state = state.copyWith(downloadResumeResponseModel: result);
      final url = result.data.fileUrl;
      if (url.isNotEmpty) {
        if (!isAdmin) {
          final anchor = html.AnchorElement(href: url)
            ..target = "blank"
            ..download = "Jishnu_kp_Flutter_Developer_Resume.pdf"
            ..click();
        }
      }
    } catch (e) {
      errorPrint("downlaod resume failed $e");
      state = state.copyWith(
        isLoading: false,
        errorMsg: "Failed to download resume",
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> uploadResume(MultipartFile file) async {
    state = state.copyWith(isLoading: true, errorMsg: null);
    try {
      final uploadResumeUsecase = ref.read(getUploadResumeUseCaseProvider);
      var result = await uploadResumeUsecase.build(file);
      state = state.copyWith(downloadResumeResponseModel: result);
    } catch (e) {
      state = state.copyWith(errorMsg: CustomHelper.getErrorMessage(e));
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchAbout() async {
    state = state.copyWith(isLoading: true);
    try {
      final fetchAboutUseCase = ref.read(getFetchAboutUsecaseProvider);
      var result = await fetchAboutUseCase.build();
      state = state.copyWith(
        aboutResponseModel: result,
        certifications: result.data.certifications,
        softSkills: result.data.softSkills,
        technicalSkills: result.data.technicalSkills,
        educations: result.data.educations,
        professionalExperience: result.data.professionalExperience,
        updatedAboutResponseModel: result,
      );
    } catch (e) {
      state = state.copyWith(
        aboutResponseModel: null,
        certifications: [],
        softSkills: [],
        technicalSkills: [],
        educations: [],
        professionalExperience: [],
        updatedAboutResponseModel: null,
      );
      errorPrint("about fetching failed = $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void updateAboutDescription(String updateDescription) {
    final current = state.updatedAboutResponseModel;

    if (current == null) return;

    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(aboutDescription: updateDescription),
      ),
    );
  }

  void updateProfessionalExperience(ProfessionalExperience newExperience) {
    final current = state.updatedAboutResponseModel;

    if (current == null) return;
    final professionalExperienceList = current.data.professionalExperience;
    final index = professionalExperienceList.indexWhere(
      (element) => element.id == newExperience.id,
    );

    List<ProfessionalExperience> updatedList;
    if (index != -1) {
      updatedList = [...professionalExperienceList];
      updatedList[index] = newExperience;
      customPrint("existing updated");
    } else {
      updatedList = [...professionalExperienceList, newExperience];
      customPrint("new added");
    }
    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(professionalExperience: updatedList),
      ),
    );
  }

  void deleteProfessionalExperience(String id) {
    final current = state.updatedAboutResponseModel;
    if (current == null) return;
    final list = current.data.professionalExperience;
    final updatedList = list.where((element) => element.id != id).toList();
    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(professionalExperience: updatedList),
      ),
    );
  }

  void updateCertifications(Certification newCertification) {
    final current = state.updatedAboutResponseModel;

    if (current == null) return;
    final certificationList = current.data.certifications;
    final index = certificationList.indexWhere(
      (element) => element.id == newCertification.id,
    );

    List<Certification> updatedList;
    if (index != -1) {
      updatedList = [...certificationList];
      updatedList[index] = newCertification;
      customPrint("existing updated");
    } else {
      updatedList = [...certificationList, newCertification];
      customPrint("new added");
    }
    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(certifications: updatedList),
      ),
    );
  }

  void deleteCertifications(String id) {
    final current = state.updatedAboutResponseModel;
    if (current == null) return;
    final list = current.data.certifications;
    final updatedList = list.where((element) => element.id != id).toList();
    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(certifications: updatedList),
      ),
    );
  }

  void updateEducation(Education newEducation) {
    final current = state.updatedAboutResponseModel;

    if (current == null) return;
    final educationList = current.data.educations;
    final index = educationList.indexWhere(
      (element) => element.id == newEducation.id,
    );

    List<Education> updatedList;
    if (index != -1) {
      updatedList = [...educationList];
      updatedList[index] = newEducation;
      customPrint("existing updated");
    } else {
      updatedList = [...educationList, newEducation];
      customPrint("new added");
    }
    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(educations: updatedList),
      ),
    );
  }

  void deleteEducation(String id) {
    final current = state.updatedAboutResponseModel;
    if (current == null) return;
    final list = current.data.educations;
    final updatedList = list.where((element) => element.id != id).toList();
    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(educations: updatedList),
      ),
    );
  }

  void updateSkill(String newSkill, bool isTechnical) {
    final current = state.updatedAboutResponseModel;

    if (current == null) return;
    final data = current.data;
    if (isTechnical) {
      if (data.technicalSkills.contains(newSkill)) return;
      final updated = [...data.technicalSkills, newSkill];
      state = state.copyWith(
        updatedAboutResponseModel: current.copyWith(
          data: current.data.copyWith(technicalSkills: updated),
        ),
      );
    } else {
      if (data.softSkills.contains(newSkill)) return;
      final updated = [...data.softSkills, newSkill];
      state = state.copyWith(
        updatedAboutResponseModel: current.copyWith(
          data: current.data.copyWith(softSkills: updated),
        ),
      );
    }
  }

  void deleteSkills(String skill, bool isTechnical) {
    final current = state.updatedAboutResponseModel;
    if (current == null) return;

    final data = current.data;
    final updatedTechnical = isTechnical
        ? data.technicalSkills.where((element) => element != skill).toList()
        : data.technicalSkills;

    final updatedSoft = !isTechnical
        ? data.softSkills.where((element) => element != skill).toList()
        : data.softSkills;

    state = state.copyWith(
      updatedAboutResponseModel: current.copyWith(
        data: current.data.copyWith(
          softSkills: updatedSoft,
          technicalSkills: updatedTechnical,
        ),
      ),
    );
  }

  Future<void> updateAbout(UpdateAboutRequestModel requestModal) async {
    state = state.copyWith(isLoading: true, errorMsg: null);
    try {
      final updateAboutUsecase = ref.read(getUpdateAboutUseCaseProvider);
      var result = await updateAboutUsecase.build(requestModal);
      state = state.copyWith(
        aboutResponseModel: result,
        updatedAboutResponseModel: result,
      );
      successPrint("update about successfully");
    } catch (e) {
      state = state.copyWith(errorMsg: CustomHelper.getErrorMessage(e));
      errorPrint("update about failed - $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
