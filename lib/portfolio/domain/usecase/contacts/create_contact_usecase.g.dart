// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCreateContactUsecase)
final getCreateContactUsecaseProvider = GetCreateContactUsecaseProvider._();

final class GetCreateContactUsecaseProvider
    extends
        $FunctionalProvider<
          CreateContactUsecase,
          CreateContactUsecase,
          CreateContactUsecase
        >
    with $Provider<CreateContactUsecase> {
  GetCreateContactUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCreateContactUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCreateContactUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateContactUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateContactUsecase create(Ref ref) {
    return getCreateContactUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateContactUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateContactUsecase>(value),
    );
  }
}

String _$getCreateContactUsecaseHash() =>
    r'ef30cb7cb3cbc40f44d237d3ef9bac990942fd7e';
