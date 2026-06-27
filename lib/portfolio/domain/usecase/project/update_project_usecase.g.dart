// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_project_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUpdateProjectUsecase)
const getUpdateProjectUsecaseProvider = GetUpdateProjectUsecaseProvider._();

final class GetUpdateProjectUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateProjectUsecase,
          UpdateProjectUsecase,
          UpdateProjectUsecase
        >
    with $Provider<UpdateProjectUsecase> {
  const GetUpdateProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUpdateProjectUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUpdateProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateProjectUsecase create(Ref ref) {
    return getUpdateProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateProjectUsecase>(value),
    );
  }
}

String _$getUpdateProjectUsecaseHash() =>
    r'63b084405febf993e57851764badbef7c321cb27';
