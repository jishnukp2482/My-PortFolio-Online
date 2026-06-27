// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_img_delete_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDeleteProjectImgUsecase)
const getDeleteProjectImgUsecaseProvider =
    GetDeleteProjectImgUsecaseProvider._();

final class GetDeleteProjectImgUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteProjectImgUsecase,
          DeleteProjectImgUsecase,
          DeleteProjectImgUsecase
        >
    with $Provider<DeleteProjectImgUsecase> {
  const GetDeleteProjectImgUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDeleteProjectImgUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDeleteProjectImgUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectImgUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteProjectImgUsecase create(Ref ref) {
    return getDeleteProjectImgUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectImgUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectImgUsecase>(value),
    );
  }
}

String _$getDeleteProjectImgUsecaseHash() =>
    r'135406675b7cd0033635c84d3ba036efd98d0b20';
