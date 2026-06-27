// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectController)
const projectControllerProvider = ProjectControllerProvider._();

final class ProjectControllerProvider
    extends $NotifierProvider<ProjectController, ProjectState> {
  const ProjectControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectControllerHash();

  @$internal
  @override
  ProjectController create() => ProjectController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectState>(value),
    );
  }
}

String _$projectControllerHash() => r'b37a03032c179589b8513b781bcf3e0d91bc807e';

abstract class _$ProjectController extends $Notifier<ProjectState> {
  ProjectState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProjectState, ProjectState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectState, ProjectState>,
              ProjectState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
