// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_about_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFetchAboutUsecase)
final getFetchAboutUsecaseProvider = GetFetchAboutUsecaseProvider._();

final class GetFetchAboutUsecaseProvider
    extends
        $FunctionalProvider<
          FetchAboutUsecase,
          FetchAboutUsecase,
          FetchAboutUsecase
        >
    with $Provider<FetchAboutUsecase> {
  GetFetchAboutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFetchAboutUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFetchAboutUsecaseHash();

  @$internal
  @override
  $ProviderElement<FetchAboutUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchAboutUsecase create(Ref ref) {
    return getFetchAboutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchAboutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FetchAboutUsecase>(value),
    );
  }
}

String _$getFetchAboutUsecaseHash() =>
    r'eaf1398c13b6880dbf95b467513a967a3ee74063';
