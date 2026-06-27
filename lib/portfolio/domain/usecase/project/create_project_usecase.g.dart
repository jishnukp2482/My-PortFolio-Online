// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCreateProjectUsecase)
const getCreateProjectUsecaseProvider = GetCreateProjectUsecaseProvider._();

final class GetCreateProjectUsecaseProvider
    extends
        $FunctionalProvider<
          CreateProjectUsecase,
          CreateProjectUsecase,
          CreateProjectUsecase
        >
    with $Provider<CreateProjectUsecase> {
  const GetCreateProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCreateProjectUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCreateProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateProjectUsecase create(Ref ref) {
    return getCreateProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateProjectUsecase>(value),
    );
  }
}

String _$getCreateProjectUsecaseHash() =>
    r'cb8af5ba3c8429cbdc38a29ed8a40671c0069059';
