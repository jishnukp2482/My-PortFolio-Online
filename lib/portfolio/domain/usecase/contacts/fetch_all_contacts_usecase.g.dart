// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_all_contacts_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFetchAllContactsUsecase)
const getFetchAllContactsUsecaseProvider =
    GetFetchAllContactsUsecaseProvider._();

final class GetFetchAllContactsUsecaseProvider
    extends
        $FunctionalProvider<
          FetchAllContactsUsecase,
          FetchAllContactsUsecase,
          FetchAllContactsUsecase
        >
    with $Provider<FetchAllContactsUsecase> {
  const GetFetchAllContactsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFetchAllContactsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFetchAllContactsUsecaseHash();

  @$internal
  @override
  $ProviderElement<FetchAllContactsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchAllContactsUsecase create(Ref ref) {
    return getFetchAllContactsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchAllContactsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchAllContactsUsecase>(value),
    );
  }
}

String _$getFetchAllContactsUsecaseHash() =>
    r'551b05d0c4efcfa33f1c9f3e186240fc6f9e4116';
