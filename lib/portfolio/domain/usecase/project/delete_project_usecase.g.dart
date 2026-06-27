// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_project_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDeleteProjectUsecase)
const getDeleteProjectUsecaseProvider = GetDeleteProjectUsecaseProvider._();

final class GetDeleteProjectUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteProjectUsecase,
          DeleteProjectUsecase,
          DeleteProjectUsecase
        >
    with $Provider<DeleteProjectUsecase> {
  const GetDeleteProjectUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDeleteProjectUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDeleteProjectUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteProjectUsecase create(Ref ref) {
    return getDeleteProjectUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectUsecase>(value),
    );
  }
}

String _$getDeleteProjectUsecaseHash() =>
    r'29325348150c648b4388560ec6c1c9eb20c6b208';
