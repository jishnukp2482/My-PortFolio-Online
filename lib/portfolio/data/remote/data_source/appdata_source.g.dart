// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdata_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAppDataSource)
const getAppDataSourceProvider = GetAppDataSourceProvider._();

final class GetAppDataSourceProvider
    extends $FunctionalProvider<AppDataSource, AppDataSource, AppDataSource>
    with $Provider<AppDataSource> {
  const GetAppDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAppDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAppDataSourceHash();

  @$internal
  @override
  $ProviderElement<AppDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDataSource create(Ref ref) {
    return getAppDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDataSource>(value),
    );
  }
}

String _$getAppDataSourceHash() => r'0c21162890b4a0b0db3fedcda945ec88c051f468';
