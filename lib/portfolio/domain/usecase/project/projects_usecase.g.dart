// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getProjectUseCase)
final getProjectUseCaseProvider = GetProjectUseCaseProvider._();

final class GetProjectUseCaseProvider
    extends
        $FunctionalProvider<ProjectsUsecase, ProjectsUsecase, ProjectsUsecase>
    with $Provider<ProjectsUsecase> {
  GetProjectUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProjectUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProjectUseCaseHash();

  @$internal
  @override
  $ProviderElement<ProjectsUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectsUsecase create(Ref ref) {
    return getProjectUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectsUsecase>(value),
    );
  }
}

String _$getProjectUseCaseHash() => r'7fe9b70eab0add444244a50e7b2b1188ed1bb691';
