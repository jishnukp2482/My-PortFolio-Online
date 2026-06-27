import 'package:potfolio/portfolio/data/remote/modals/response/about/about_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/about/download_resume_response_model.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/contacts/create_contact_response_model.dart';

class AboutState {
  final bool isLoading;
  final DownloadResumeResponseModel? downloadResumeResponseModel;
  final AboutResponseModel? aboutResponseModel;
  final List<Certification> certifications;
  final List<Education> educations;
  final List<ProfessionalExperience> professionalExperience;
  final List<String> softSkills;
  final List<String> technicalSkills;
  final String? errorMsg;

  ///Admin
  final AboutResponseModel? updatedAboutResponseModel;
  
  AboutState(
      {required this.isLoading,
      this.downloadResumeResponseModel,
      this.aboutResponseModel,
      this.errorMsg,
      required this.certifications,
      required this.educations,
      required this.professionalExperience,
      required this.softSkills,
      required this.technicalSkills,
      this.updatedAboutResponseModel,});

  factory AboutState.initial() => AboutState(
      isLoading: false,
      certifications: [],
      educations: [],
      professionalExperience: [],
      softSkills: [],
      technicalSkills: []);

  AboutState copyWith(
      {bool? isLoading,
      DownloadResumeResponseModel? downloadResumeResponseModel,
      AboutResponseModel? aboutResponseModel,
      String? errorMsg,
      List<Certification>? certifications,
      List<Education>? educations,
      List<ProfessionalExperience>? professionalExperience,
      List<String>? softSkills,
      List<String>? technicalSkills,
      

      ///Admin
      AboutResponseModel? updatedAboutResponseModel,
     
      }) {
    return AboutState(
        isLoading: isLoading ?? this.isLoading,
        downloadResumeResponseModel:
            downloadResumeResponseModel ?? this.downloadResumeResponseModel,
        aboutResponseModel: aboutResponseModel ?? this.aboutResponseModel,
        errorMsg: errorMsg ?? this.errorMsg,
        certifications: certifications ?? this.certifications,
        educations: educations ?? this.educations,
        professionalExperience:
            professionalExperience ?? this.professionalExperience,
        softSkills: softSkills ?? this.softSkills,
        technicalSkills: technicalSkills ?? this.technicalSkills,
        updatedAboutResponseModel:
            updatedAboutResponseModel ?? this.updatedAboutResponseModel,
          
            );
  }
}
