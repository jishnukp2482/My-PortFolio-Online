// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_contact_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDeleteContactUsecase)
const getDeleteContactUsecaseProvider = GetDeleteContactUsecaseProvider._();

final class GetDeleteContactUsecaseProvider
    extends
        $FunctionalProvider<
          DeleteContactUsecase,
          DeleteContactUsecase,
          DeleteContactUsecase
        >
    with $Provider<DeleteContactUsecase> {
  const GetDeleteContactUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDeleteContactUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDeleteContactUsecaseHash();

  @$internal
  @override
  $ProviderElement<DeleteContactUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteContactUsecase create(Ref ref) {
    return getDeleteContactUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteContactUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteContactUsecase>(value),
    );
  }
}

String _$getDeleteContactUsecaseHash() =>
    r'54bc4d7d8f2f2b5edc0eb1d2ba3c5c121f97af07';
