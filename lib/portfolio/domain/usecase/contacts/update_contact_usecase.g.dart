// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_contact_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUpdateContactUsecase)
final getUpdateContactUsecaseProvider = GetUpdateContactUsecaseProvider._();

final class GetUpdateContactUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateContactUsecase,
          UpdateContactUsecase,
          UpdateContactUsecase
        >
    with $Provider<UpdateContactUsecase> {
  GetUpdateContactUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUpdateContactUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUpdateContactUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateContactUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateContactUsecase create(Ref ref) {
    return getUpdateContactUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateContactUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateContactUsecase>(value),
    );
  }
}

String _$getUpdateContactUsecaseHash() =>
    r'5eb4ba1e37d55aebd74a88d324d13d1adb63a738';
