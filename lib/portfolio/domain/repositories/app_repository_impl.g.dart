// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAppRepository)
const getAppRepositoryProvider = GetAppRepositoryProvider._();

final class GetAppRepositoryProvider
    extends $FunctionalProvider<AppRepository, AppRepository, AppRepository>
    with $Provider<AppRepository> {
  const GetAppRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAppRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAppRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRepository create(Ref ref) {
    return getAppRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRepository>(value),
    );
  }
}

String _$getAppRepositoryHash() => r'b091a59782572e3bbc666a5c816ac7f885c11437';
