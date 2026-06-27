import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/domain/entities/projects/projects_modal.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/key_features_builder.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/empty_state.dart';

class FrontendTechnologies extends StatelessWidget {
  FrontendTechnologies(
      {super.key,
      this.keyFeaturesSize,
      this.bulletSize,
      this.bulletHeight,
      required this.projectsModal,
      this.iconSize});

  final double? bulletSize;
  final double? bulletHeight;
  final double? keyFeaturesSize;
  final ProjectData projectsModal;
  final double? iconSize;
  final frontEndTechnologies = <KeyFeature>[];
  @override
  Widget build(BuildContext context) {
    final frontEndTechnologies = projectsModal.technologies
        .where(
          (e) => e.technologies.toLowerCase() == "frontend",
        )
        .map(
          (e) => KeyFeature(feature: e.description, id: e.id),
        )
        .toList();

    if (frontEndTechnologies.isEmpty) {
      return EmptyState(message: "No frontend technologies available");
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: frontEndTechnologies.length,
        itemBuilder: (context, index) {
          return KeyFeaturesItem(
            keyFeature: frontEndTechnologies[index],
            bulletHeight: bulletHeight,
            bulletSize: bulletSize,
            keyFeaturesSize: keyFeaturesSize,
            iconsize: iconSize,
          );
        },
      ),
    );
  }
}

class BackendTechnologies extends StatelessWidget {
  BackendTechnologies(
      {super.key,
      this.keyFeaturesSize,
      this.bulletSize,
      this.bulletHeight,
      required this.projectsModal,
      this.iconSize});

  final double? keyFeaturesSize;
  final double? bulletSize;
  final double? bulletHeight;
  final ProjectData projectsModal;
  final double? iconSize;
  final backendTechnologiesUsed = <KeyFeature>[];
  @override
  Widget build(BuildContext context) {
    final backendTechnologiesUsed = projectsModal.technologies
        .where(
          (e) => e.technologies.toLowerCase() == "backend",
        )
        .map(
          (e) => KeyFeature(feature: e.description, id: e.id),
        )
        .toList();

    if (backendTechnologiesUsed.isEmpty) {
      return EmptyState(message: "No backend technologies available");
    }
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: backendTechnologiesUsed.length,
        itemBuilder: (context, index) {
          return KeyFeaturesItem(
            keyFeature: backendTechnologiesUsed[index],
            bulletHeight: bulletHeight,
            bulletSize: bulletSize,
            keyFeaturesSize: keyFeaturesSize,
            iconsize: iconSize,
          );
        },
      ),
    );
  }
}
